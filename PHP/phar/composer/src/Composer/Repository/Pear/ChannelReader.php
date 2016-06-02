<?php











namespace Composer\Repository\Pear;

use Composer\Util\RemoteFilesystem;








class ChannelReader extends BaseChannelReader
{

private $readerMap;

public function __construct(RemoteFilesystem $rfs)
{
parent::__construct($rfs);

$rest10reader = new ChannelRest10Reader($rfs);
$rest11reader = new ChannelRest11Reader($rfs);

$this->readerMap = array(
'REST1.3' => $rest11reader,
'REST1.2' => $rest11reader,
'REST1.1' => $rest11reader,
'REST1.0' => $rest10reader,
);
}








public function read($url)
{
$xml = $this->requestXml($url, "/channel.xml");

$channelName = (string) $xml->name;
$channelAlias = (string) $xml->suggestedalias;

$supportedVersions = array_keys($this->readerMap);
$selectedRestVersion = $this->selectRestVersion($xml, $supportedVersions);
if (!$selectedRestVersion) {
throw new \UnexpectedValueException(sprintf('PEAR repository %s does not supports any of %s protocols.', $url, implode(', ', $supportedVersions)));
}

$reader = $this->readerMap[$selectedRestVersion['version']];
$packageDefinitions = $reader->read($selectedRestVersion['baseUrl']);

return new ChannelInfo($channelName, $channelAlias, $packageDefinitions);
}








private function selectRestVersion($channelXml, $supportedVersions)
{
$channelXml->registerXPathNamespace('ns', self::CHANNEL_NS);

foreach ($supportedVersions as $version) {
$xpathTest = "ns:servers/ns:*/ns:rest/ns:baseurl[@type='{$version}']";
$testResult = $channelXml->xpath($xpathTest);

foreach ($testResult as $result) {

 $result = (string) $result;
if (preg_match('{^https://}i', $result)) {
return array('version' => $version, 'baseUrl' => $result);
}
}


 if (count($testResult) > 0) {
return array('version' => $version, 'baseUrl' => (string) $testResult[0]);
}
}

return null;
}
}
