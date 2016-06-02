<?php











namespace Composer\Repository;

use Composer\Package\RootPackageInterface;
use Composer\Semver\Constraint\ConstraintInterface;
use Composer\Semver\Constraint\Constraint;
use Composer\Package\Link;






abstract class BaseRepository implements RepositoryInterface
{













public function getDependents($needle, $constraint = null, $invert = false, $recurse = true, $packagesFound = null)
{
$needles = (array) $needle;
$results = array();


 if (null === $packagesFound) {
$packagesFound = $needles;
}


 $rootPackage = null;
foreach ($this->getPackages() as $package) {
if ($package instanceof RootPackageInterface) {
$rootPackage = $package;
break;
}
}


 foreach ($this->getPackages() as $package) {
$links = $package->getRequires();


 
 $packagesInTree = $packagesFound;


 if (!$invert) {
$links += $package->getReplaces();
}


 if ($package instanceof RootPackageInterface) {
$links += $package->getDevRequires();
}


 foreach ($links as $link) {
foreach ($needles as $needle) {
if ($link->getTarget() === $needle) {
if (is_null($constraint) || (($link->getConstraint()->matches($constraint) === !$invert))) {

 if (in_array($link->getSource(), $packagesInTree)) {
$results[$link->getSource()] = array($package, $link, false);
continue;
}
$packagesInTree[] = $link->getSource();
$dependents = $recurse ? $this->getDependents($link->getSource(), null, false, true, $packagesInTree) : array();
$results[$link->getSource()] = array($package, $link, $dependents);
}
}
}
}


 if ($invert && in_array($package->getName(), $needles)) {
foreach ($package->getConflicts() as $link) {
foreach ($this->findPackages($link->getTarget()) as $pkg) {
$version = new Constraint('=', $pkg->getVersion());
if ($link->getConstraint()->matches($version) === $invert) {
$results[] = array($package, $link, false);
}
}
}
}


 if ($invert && $constraint && in_array($package->getName(), $needles) && $constraint->matches(new Constraint('=', $package->getVersion()))) {
foreach ($package->getRequires() as $link) {
if (preg_match(PlatformRepository::PLATFORM_PACKAGE_REGEX, $link->getTarget())) {
if ($this->findPackage($link->getTarget(), $link->getConstraint())) {
continue;
}

$platformPkg = $this->findPackage($link->getTarget(), '*');
$description = $platformPkg ? 'but '.$platformPkg->getPrettyVersion().' is installed' : 'but it is missing';
$results[] = array($package, new Link($package->getName(), $link->getTarget(), null, 'requires', $link->getPrettyConstraint().' '.$description), false);

continue;
}

foreach ($this->getPackages() as $pkg) {
if (!in_array($link->getTarget(), $pkg->getNames())) {
continue;
}

$version = new Constraint('=', $pkg->getVersion());
if (!$link->getConstraint()->matches($version)) {

 
 if ($rootPackage) {
foreach (array_merge($rootPackage->getRequires(), $rootPackage->getDevRequires()) as $rootReq) {
if (in_array($rootReq->getTarget(), $pkg->getNames()) && !$rootReq->getConstraint()->matches($link->getConstraint())) {
$results[] = array($package, $link, false);
$results[] = array($rootPackage, $rootReq, false);
continue 3;
}
}
$results[] = array($package, $link, false);
$results[] = array($rootPackage, new Link($rootPackage->getName(), $link->getTarget(), null, 'does not require', 'but ' . $pkg->getPrettyVersion() . ' is installed'), false);
} else {

 $results[] = array($package, $link, false);
}
}

continue 2;
}
}
}
}

ksort($results);

return $results;
}
}
