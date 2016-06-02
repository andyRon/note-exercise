<?php











namespace Composer\Command;

use Composer\DependencyResolver\Pool;
use Composer\Package\Link;
use Composer\Package\PackageInterface;
use Composer\Repository\ArrayRepository;
use Composer\Repository\CompositeRepository;
use Composer\Repository\PlatformRepository;
use Composer\Repository\RepositoryFactory;
use Composer\Plugin\CommandEvent;
use Composer\Plugin\PluginEvents;
use Symfony\Component\Console\Formatter\OutputFormatterStyle;
use Composer\Package\Version\VersionParser;
use Symfony\Component\Console\Helper\Table;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;






class BaseDependencyCommand extends BaseCommand
{
const ARGUMENT_PACKAGE = 'package';
const ARGUMENT_CONSTRAINT = 'constraint';
const OPTION_RECURSIVE = 'recursive';
const OPTION_TREE = 'tree';

protected $colors;




protected function configure()
{
$this->setDefinition(array(
new InputArgument(self::ARGUMENT_PACKAGE, InputArgument::REQUIRED, 'Package to inspect'),
new InputArgument(self::ARGUMENT_CONSTRAINT, InputArgument::OPTIONAL, 'Optional version constraint', '*'),
new InputOption(self::OPTION_RECURSIVE, 'r', InputOption::VALUE_NONE, 'Recursively resolves up to the root package'),
new InputOption(self::OPTION_TREE, 't', InputOption::VALUE_NONE, 'Prints the results as a nested tree'),
));
}









protected function doExecute(InputInterface $input, OutputInterface $output, $inverted = false)
{

 $composer = $this->getComposer();
$commandEvent = new CommandEvent(PluginEvents::COMMAND, $this->getName(), $input, $output);
$composer->getEventDispatcher()->dispatch($commandEvent->getName(), $commandEvent);


 $platformOverrides = $composer->getConfig()->get('platform') ?: array();
$repository = new CompositeRepository(array(
new ArrayRepository(array($composer->getPackage())),
$composer->getRepositoryManager()->getLocalRepository(),
new PlatformRepository(array(), $platformOverrides),
));
$pool = new Pool();
$pool->addRepository($repository);


 list($needle, $textConstraint) = array_pad(
explode(':', $input->getArgument(self::ARGUMENT_PACKAGE)),
2,
$input->getArgument(self::ARGUMENT_CONSTRAINT)
);


 $packages = $pool->whatProvides($needle);
if (empty($packages)) {
throw new \InvalidArgumentException(sprintf('Could not find package "%s" in your project', $needle));
}


 
 if (!$repository->findPackage($needle, $textConstraint)) {
$defaultRepos = new CompositeRepository(RepositoryFactory::defaultRepos($this->getIO()));
if ($match = $defaultRepos->findPackage($needle, $textConstraint)) {
$repository->addRepository(new ArrayRepository(array(clone $match)));
}
}


 $needles = array($needle);
if ($inverted) {
foreach ($packages as $package) {
$needles = array_merge($needles, array_map(function (Link $link) {
return $link->getTarget();
}, $package->getReplaces()));
}
}


 if ('*' !== $textConstraint) {
$versionParser = new VersionParser();
$constraint = $versionParser->parseConstraints($textConstraint);
} else {
$constraint = null;
}


 $renderTree = $input->getOption(self::OPTION_TREE);
$recursive = $renderTree || $input->getOption(self::OPTION_RECURSIVE);


 $results = $repository->getDependents($needles, $constraint, $inverted, $recursive);
if (empty($results)) {
$extra = (null !== $constraint) ? sprintf(' in versions %smatching %s', $inverted ? 'not ' : '', $textConstraint) : '';
$this->getIO()->writeError(sprintf('<info>There is no installed package depending on "%s"%s</info>',
$needle, $extra));
} elseif ($renderTree) {
$this->initStyles($output);
$root = $packages[0];
$this->getIO()->write(sprintf('<info>%s</info> %s %s', $root->getPrettyName(), $root->getPrettyVersion(), $root->getDescription()));
$this->printTree($results);
} else {
$this->printTable($output, $results);
}

return 0;
}







protected function printTable(OutputInterface $output, $results)
{
$table = array();
$doubles = array();
do {
$queue = array();
$rows = array();
foreach ($results as $result) {




list($package, $link, $children) = $result;
$unique = (string) $link;
if (isset($doubles[$unique])) {
continue;
}
$doubles[$unique] = true;
$version = (strpos($package->getPrettyVersion(), 'No version set') === 0) ? '-' : $package->getPrettyVersion();
$rows[] = array($package->getPrettyName(), $version, $link->getDescription(), sprintf('%s (%s)', $link->getTarget(), $link->getPrettyConstraint()));
if ($children) {
$queue = array_merge($queue, $children);
}
}
$results = $queue;
$table = array_merge($rows, $table);
} while (!empty($results));


 $renderer = new Table($output);
$renderer->setStyle('compact');
$renderer->getStyle()->setVerticalBorderChar('');
$renderer->getStyle()->setCellRowContentFormat('%s  ');
$renderer->setRows($table)->render();
}






protected function initStyles(OutputInterface $output)
{
$this->colors = array(
'green',
'yellow',
'cyan',
'magenta',
'blue',
);

foreach ($this->colors as $color) {
$style = new OutputFormatterStyle($color);
$output->getFormatter()->setStyle($color, $style);
}
}








protected function printTree($results, $prefix = '', $level = 1)
{
$count = count($results);
$idx = 0;
foreach ($results as $result) {





list($package, $link, $children) = $result;

$color = $this->colors[$level % count($this->colors)];
$prevColor = $this->colors[($level - 1) % count($this->colors)];
$isLast = (++$idx == $count);
$versionText = (strpos($package->getPrettyVersion(), 'No version set') === 0) ? '' : $package->getPrettyVersion();
$packageText = rtrim(sprintf('<%s>%s</%1$s> %s', $color, $package->getPrettyName(), $versionText));
$linkText = sprintf('%s <%s>%s</%2$s> %s', $link->getDescription(), $prevColor, $link->getTarget(), $link->getPrettyConstraint());
$circularWarn = $children === false ? '(circular dependency aborted here)' : '';
$this->writeTreeLine(rtrim(sprintf("%s%s%s (%s) %s", $prefix, $isLast ? '└──' : '├──', $packageText, $linkText, $circularWarn)));
if ($children) {
$this->printTree($children, $prefix . ($isLast ? '   ' : '│  '), $level + 1);
}
}
}

private function writeTreeLine($line)
{
$io = $this->getIO();
if (!$io->isDecorated()) {
$line = str_replace(array('└', '├', '──', '│'), array('`-', '|-', '-', '|'), $line);
}

$io->write($line);
}
}
