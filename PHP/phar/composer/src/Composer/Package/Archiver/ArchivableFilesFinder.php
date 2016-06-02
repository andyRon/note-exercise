<?php











namespace Composer\Package\Archiver;

use Composer\Util\Filesystem;
use FilesystemIterator;
use Symfony\Component\Finder\Finder;
use Symfony\Component\Finder\SplFileInfo;









class ArchivableFilesFinder extends \FilterIterator
{



protected $finder;







public function __construct($sources, array $excludes)
{
$fs = new Filesystem();

$sources = $fs->normalizePath($sources);

$filters = array(
new HgExcludeFilter($sources),
new GitExcludeFilter($sources),
new ComposerExcludeFilter($sources, $excludes),
);

$this->finder = new Finder();

$filter = function (\SplFileInfo $file) use ($sources, $filters, $fs) {
if ($file->isLink() && strpos($file->getLinkTarget(), $sources) !== 0) {
return false;
}

$relativePath = preg_replace(
'#^'.preg_quote($sources, '#').'#',
'',
$fs->normalizePath($file->getRealPath())
);

$exclude = false;
foreach ($filters as $filter) {
$exclude = $filter->filter($relativePath, $exclude);
}

return !$exclude;
};

if (method_exists($filter, 'bindTo')) {
$filter = $filter->bindTo(null);
}

$this->finder
->in($sources)
->filter($filter)
->ignoreVCS(true)
->ignoreDotFiles(false);

parent::__construct($this->finder->getIterator());
}

public function accept()
{

$current = $this->getInnerIterator()->current();

if (!$current->isDir()) {
return true;
}

$iterator = new FilesystemIterator($current, FilesystemIterator::SKIP_DOTS);

return !$iterator->valid();
}
}
