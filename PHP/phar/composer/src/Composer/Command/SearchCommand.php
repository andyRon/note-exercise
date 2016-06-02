<?php











namespace Composer\Command;

use Composer\Factory;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Composer\Repository\CompositeRepository;
use Composer\Repository\PlatformRepository;
use Composer\Repository\RepositoryInterface;
use Composer\Plugin\CommandEvent;
use Composer\Plugin\PluginEvents;




class SearchCommand extends BaseCommand
{
protected $matches;
protected $lowMatches = array();
protected $tokens;
protected $output;
protected $onlyName;

protected function configure()
{
$this
->setName('search')
->setDescription('Search for packages')
->setDefinition(array(
new InputOption('only-name', 'N', InputOption::VALUE_NONE, 'Search only in name'),
new InputArgument('tokens', InputArgument::IS_ARRAY | InputArgument::REQUIRED, 'tokens to search for'),
))
->setHelp(<<<EOT
The search command searches for packages by its name
<info>php composer.phar search symfony composer</info>

EOT
)
;
}

protected function execute(InputInterface $input, OutputInterface $output)
{

 $platformRepo = new PlatformRepository;
$io = $this->getIO();
if (!($composer = $this->getComposer(false))) {
$composer = Factory::create($this->getIO(), array());
}
$localRepo = $composer->getRepositoryManager()->getLocalRepository();
$installedRepo = new CompositeRepository(array($localRepo, $platformRepo));
$repos = new CompositeRepository(array_merge(array($installedRepo), $composer->getRepositoryManager()->getRepositories()));

$commandEvent = new CommandEvent(PluginEvents::COMMAND, 'search', $input, $output);
$composer->getEventDispatcher()->dispatch($commandEvent->getName(), $commandEvent);

$onlyName = $input->getOption('only-name');

$flags = $onlyName ? RepositoryInterface::SEARCH_NAME : RepositoryInterface::SEARCH_FULLTEXT;
$results = $repos->search(implode(' ', $input->getArgument('tokens')), $flags);

foreach ($results as $result) {
$io->write($result['name'] . (isset($result['description']) ? ' '. $result['description'] : ''));
}
}
}
