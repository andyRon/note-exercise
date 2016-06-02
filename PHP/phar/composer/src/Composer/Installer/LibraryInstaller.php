<?php











namespace Composer\Installer;

use Composer\Composer;
use Composer\IO\IOInterface;
use Composer\Repository\InstalledRepositoryInterface;
use Composer\Package\PackageInterface;
use Composer\Util\Filesystem;
use Composer\Util\Silencer;







class LibraryInstaller implements InstallerInterface
{
protected $composer;
protected $vendorDir;
protected $binDir;
protected $downloadManager;
protected $io;
protected $type;
protected $filesystem;
protected $binCompat;
protected $binaryInstaller;










public function __construct(IOInterface $io, Composer $composer, $type = 'library', Filesystem $filesystem = null, BinaryInstaller $binaryInstaller = null)
{
$this->composer = $composer;
$this->downloadManager = $composer->getDownloadManager();
$this->io = $io;
$this->type = $type;

$this->filesystem = $filesystem ?: new Filesystem();
$this->vendorDir = rtrim($composer->getConfig()->get('vendor-dir'), '/');
$this->binaryInstaller = $binaryInstaller ?: new BinaryInstaller($this->io, rtrim($composer->getConfig()->get('bin-dir'), '/'), $composer->getConfig()->get('bin-compat'), $this->filesystem);
}




public function supports($packageType)
{
return $packageType === $this->type || null === $this->type;
}




public function isInstalled(InstalledRepositoryInterface $repo, PackageInterface $package)
{
return $repo->hasPackage($package) && is_readable($this->getInstallPath($package));
}




public function install(InstalledRepositoryInterface $repo, PackageInterface $package)
{
$this->initializeVendorDir();
$downloadPath = $this->getInstallPath($package);


 if (!is_readable($downloadPath) && $repo->hasPackage($package)) {
$this->binaryInstaller->removeBinaries($package);
}

$this->installCode($package);
$this->binaryInstaller->installBinaries($package, $this->getInstallPath($package));
if (!$repo->hasPackage($package)) {
$repo->addPackage(clone $package);
}
}




public function update(InstalledRepositoryInterface $repo, PackageInterface $initial, PackageInterface $target)
{
if (!$repo->hasPackage($initial)) {
throw new \InvalidArgumentException('Package is not installed: '.$initial);
}

$this->initializeVendorDir();

$this->binaryInstaller->removeBinaries($initial);
$this->updateCode($initial, $target);
$this->binaryInstaller->installBinaries($target, $this->getInstallPath($target));
$repo->removePackage($initial);
if (!$repo->hasPackage($target)) {
$repo->addPackage(clone $target);
}
}




public function uninstall(InstalledRepositoryInterface $repo, PackageInterface $package)
{
if (!$repo->hasPackage($package)) {
throw new \InvalidArgumentException('Package is not installed: '.$package);
}

$this->removeCode($package);
$this->binaryInstaller->removeBinaries($package);
$repo->removePackage($package);

$downloadPath = $this->getPackageBasePath($package);
if (strpos($package->getName(), '/')) {
$packageVendorDir = dirname($downloadPath);
if (is_dir($packageVendorDir) && $this->filesystem->isDirEmpty($packageVendorDir)) {
Silencer::call('rmdir', $packageVendorDir);
}
}
}




public function getInstallPath(PackageInterface $package)
{
$this->initializeVendorDir();

$basePath = ($this->vendorDir ? $this->vendorDir.'/' : '') . $package->getPrettyName();
$targetDir = $package->getTargetDir();

return $basePath . ($targetDir ? '/'.$targetDir : '');
}










protected function getPackageBasePath(PackageInterface $package)
{
$installPath = $this->getInstallPath($package);
$targetDir = $package->getTargetDir();

if ($targetDir) {
return preg_replace('{/*'.str_replace('/', '/+', preg_quote($targetDir)).'/?$}', '', $installPath);
}

return $installPath;
}

protected function installCode(PackageInterface $package)
{
$downloadPath = $this->getInstallPath($package);
$this->downloadManager->download($package, $downloadPath);
}

protected function updateCode(PackageInterface $initial, PackageInterface $target)
{
$initialDownloadPath = $this->getInstallPath($initial);
$targetDownloadPath = $this->getInstallPath($target);
if ($targetDownloadPath !== $initialDownloadPath) {

 
 if (substr($initialDownloadPath, 0, strlen($targetDownloadPath)) === $targetDownloadPath
|| substr($targetDownloadPath, 0, strlen($initialDownloadPath)) === $initialDownloadPath
) {
$this->removeCode($initial);
$this->installCode($target);

return;
}

$this->filesystem->rename($initialDownloadPath, $targetDownloadPath);
}
$this->downloadManager->update($initial, $target, $targetDownloadPath);
}

protected function removeCode(PackageInterface $package)
{
$downloadPath = $this->getPackageBasePath($package);
$this->downloadManager->remove($package, $downloadPath);
}

protected function initializeVendorDir()
{
$this->filesystem->ensureDirectoryExists($this->vendorDir);
$this->vendorDir = realpath($this->vendorDir);
}
}
