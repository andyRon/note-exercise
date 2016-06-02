<?php











namespace Composer\Installer;

use Composer\IO\IOInterface;
use Composer\Composer;
use Composer\Downloader\PearPackageExtractor;
use Composer\Repository\InstalledRepositoryInterface;
use Composer\Package\PackageInterface;
use Composer\Util\Platform;
use Composer\Util\Filesystem;







class PearInstaller extends LibraryInstaller
{







public function __construct(IOInterface $io, Composer $composer, $type = 'pear-library')
{
$filesystem = new Filesystem();
$binaryInstaller = new PearBinaryInstaller($io, rtrim($composer->getConfig()->get('bin-dir'), '/'), rtrim($composer->getConfig()->get('vendor-dir'), '/'), $composer->getConfig()->get('bin-compat'), $filesystem, $this);

parent::__construct($io, $composer, $type, $filesystem, $binaryInstaller);
}




public function update(InstalledRepositoryInterface $repo, PackageInterface $initial, PackageInterface $target)
{
$this->uninstall($repo, $initial);
$this->install($repo, $target);
}

protected function installCode(PackageInterface $package)
{
parent::installCode($package);

$isWindows = Platform::isWindows();
$php_bin = $this->binDir . ($isWindows ? '/composer-php.bat' : '/composer-php');

if (!$isWindows) {
$php_bin = '/usr/bin/env ' . $php_bin;
}

$installPath = $this->getInstallPath($package);
$vars = array(
'os' => $isWindows ? 'windows' : 'linux',
'php_bin' => $php_bin,
'pear_php' => $installPath,
'php_dir' => $installPath,
'bin_dir' => $installPath . '/bin',
'data_dir' => $installPath . '/data',
'version' => $package->getPrettyVersion(),
);

$packageArchive = $this->getInstallPath($package).'/'.pathinfo($package->getDistUrl(), PATHINFO_BASENAME);
$pearExtractor = new PearPackageExtractor($packageArchive);
$pearExtractor->extractTo($this->getInstallPath($package), array('php' => '/', 'script' => '/bin', 'data' => '/data'), $vars);

$this->io->writeError('    Cleaning up', true, IOInterface::VERBOSE);
$this->filesystem->unlink($packageArchive);
}
}
