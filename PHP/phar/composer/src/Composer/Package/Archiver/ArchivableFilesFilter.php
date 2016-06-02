<?php











namespace Composer\Package\Archiver;

use FilterIterator;
use PharData;

class ArchivableFilesFilter extends FilterIterator
{
private $dirs = array();




public function accept()
{
$file = $this->getInnerIterator()->current();
if ($file->isDir()) {
$this->dirs[] = (string)$file;

return false;
}

return true;
}

public function addEmptyDir(PharData $phar, $sources)
{
foreach ($this->dirs as $filepath) {
$localname = str_replace($sources . "/", '', $filepath);
$phar->addEmptyDir($localname);
}
}
}
