<?php











namespace Composer\Repository\Pear;






class PackageDependencyParser
{






public function buildDependencyInfo($depArray)
{
if (!is_array($depArray)) {
return new DependencyInfo(array(), array());
}
if (!$this->isHash($depArray)) {
return new DependencyInfo($this->buildDependency10Info($depArray), array());
}

return $this->buildDependency20Info($depArray);
}













private function buildDependency10Info($depArray)
{
static $dep10toOperatorMap = array('has' => '==', 'eq' => '==', 'ge' => '>=', 'gt' => '>', 'le' => '<=', 'lt' => '<', 'not' => '!=');

$result = array();

foreach ($depArray as $depItem) {
if (empty($depItem['rel']) || !array_key_exists($depItem['rel'], $dep10toOperatorMap)) {

 continue;
}

$depType = !empty($depItem['optional']) && 'yes' == $depItem['optional']
? 'optional'
: 'required';
$depType = 'not' == $depItem['rel']
? 'conflicts'
: $depType;

$depVersion = !empty($depItem['version']) ? $this->parseVersion($depItem['version']) : '*';


 $depVersionConstraint = ('has' == $depItem['rel'] || 'not' == $depItem['rel']) && '*' == $depVersion
? '*'
: $dep10toOperatorMap[$depItem['rel']] . $depVersion;

switch ($depItem['type']) {
case 'php':
$depChannelName = 'php';
$depPackageName = '';
break;
case 'pkg':
$depChannelName = !empty($depItem['channel']) ? $depItem['channel'] : 'pear.php.net';
$depPackageName = $depItem['name'];
break;
case 'ext':
$depChannelName = 'ext';
$depPackageName = $depItem['name'];
break;
case 'os':
case 'sapi':
$depChannelName = '';
$depPackageName = '';
break;
default:
$depChannelName = '';
$depPackageName = '';
break;
}

if ('' != $depChannelName) {
$result[] = new DependencyConstraint(
$depType,
$depVersionConstraint,
$depChannelName,
$depPackageName
);
}
}

return $result;
}







private function buildDependency20Info($depArray)
{
$result = array();
$optionals = array();
$defaultOptionals = array();
foreach ($depArray as $depType => $depTypeGroup) {
if (!is_array($depTypeGroup)) {
continue;
}
if ('required' == $depType || 'optional' == $depType) {
foreach ($depTypeGroup as $depItemType => $depItem) {
switch ($depItemType) {
case 'php':
$result[] = new DependencyConstraint(
$depType,
$this->parse20VersionConstraint($depItem),
'php',
''
);
break;
case 'package':
$deps = $this->buildDepPackageConstraints($depItem, $depType);
$result = array_merge($result, $deps);
break;
case 'extension':
$deps = $this->buildDepExtensionConstraints($depItem, $depType);
$result = array_merge($result, $deps);
break;
case 'subpackage':
$deps = $this->buildDepPackageConstraints($depItem, 'replaces');
$defaultOptionals += $deps;
break;
case 'os':
case 'pearinstaller':
break;
default:
break;
}
}
} elseif ('group' == $depType) {
if ($this->isHash($depTypeGroup)) {
$depTypeGroup = array($depTypeGroup);
}

foreach ($depTypeGroup as $depItem) {
$groupName = $depItem['attribs']['name'];
if (!isset($optionals[$groupName])) {
$optionals[$groupName] = array();
}

if (isset($depItem['subpackage'])) {
$optionals[$groupName] += $this->buildDepPackageConstraints($depItem['subpackage'], 'replaces');
} else {
$result += $this->buildDepPackageConstraints($depItem['package'], 'optional');
}
}
}
}

if (count($defaultOptionals) > 0) {
$optionals['*'] = $defaultOptionals;
}

return new DependencyInfo($result, $optionals);
}








private function buildDepExtensionConstraints($depItem, $depType)
{
if ($this->isHash($depItem)) {
$depItem = array($depItem);
}

$result = array();
foreach ($depItem as $subDepItem) {
$depChannelName = 'ext';
$depPackageName = $subDepItem['name'];
$depVersionConstraint = $this->parse20VersionConstraint($subDepItem);

$result[] = new DependencyConstraint(
$depType,
$depVersionConstraint,
$depChannelName,
$depPackageName
);
}

return $result;
}








private function buildDepPackageConstraints($depItem, $depType)
{
if ($this->isHash($depItem)) {
$depItem = array($depItem);
}

$result = array();
foreach ($depItem as $subDepItem) {
$depChannelName = $subDepItem['channel'];
$depPackageName = $subDepItem['name'];
$depVersionConstraint = $this->parse20VersionConstraint($subDepItem);
if (isset($subDepItem['conflicts'])) {
$depType = 'conflicts';
}

$result[] = new DependencyConstraint(
$depType,
$depVersionConstraint,
$depChannelName,
$depPackageName
);
}

return $result;
}







private function parse20VersionConstraint(array $data)
{
static $dep20toOperatorMap = array('has' => '==', 'min' => '>=', 'max' => '<=', 'exclude' => '!=');

$versions = array();
$values = array_intersect_key($data, $dep20toOperatorMap);
if (0 == count($values)) {
return '*';
}
if (isset($values['min']) && isset($values['exclude']) && $data['min'] == $data['exclude']) {
$versions[] = '>' . $this->parseVersion($values['min']);
} elseif (isset($values['max']) && isset($values['exclude']) && $data['max'] == $data['exclude']) {
$versions[] = '<' . $this->parseVersion($values['max']);
} else {
foreach ($values as $op => $version) {
if ('exclude' == $op && is_array($version)) {
foreach ($version as $versionPart) {
$versions[] = $dep20toOperatorMap[$op] . $this->parseVersion($versionPart);
}
} else {
$versions[] = $dep20toOperatorMap[$op] . $this->parseVersion($version);
}
}
}

return implode(',', $versions);
}







private function parseVersion($version)
{
if (preg_match('{^v?(\d{1,3})(\.\d+)?(\.\d+)?(\.\d+)?}i', $version, $matches)) {
$version = $matches[1]
.(!empty($matches[2]) ? $matches[2] : '.0')
.(!empty($matches[3]) ? $matches[3] : '.0')
.(!empty($matches[4]) ? $matches[4] : '.0');

return $version;
}

return null;
}







private function isHash(array $array)
{
return !array_key_exists(1, $array) && !array_key_exists(0, $array);
}
}
