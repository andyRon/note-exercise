<?php










namespace Symfony\Component\Process\Pipes;

use Symfony\Component\Process\Process;








class UnixPipes extends AbstractPipes
{

private $ttyMode;

private $ptyMode;

private $disableOutput;

public function __construct($ttyMode, $ptyMode, $input, $disableOutput)
{
$this->ttyMode = (bool) $ttyMode;
$this->ptyMode = (bool) $ptyMode;
$this->disableOutput = (bool) $disableOutput;

parent::__construct($input);
}

public function __destruct()
{
$this->close();
}




public function getDescriptors()
{
if ($this->disableOutput) {
$nullstream = fopen('/dev/null', 'c');

return array(
array('pipe', 'r'),
$nullstream,
$nullstream,
);
}

if ($this->ttyMode) {
return array(
array('file', '/dev/tty', 'r'),
array('file', '/dev/tty', 'w'),
array('file', '/dev/tty', 'w'),
);
}

if ($this->ptyMode && Process::isPtySupported()) {
return array(
array('pty'),
array('pty'),
array('pty'),
);
}

return array(
array('pipe', 'r'),
array('pipe', 'w'), 
 array('pipe', 'w'), 
 );
}




public function getFiles()
{
return array();
}




public function readAndWrite($blocking, $close = false)
{
$this->unblock();
$w = $this->write();

$read = $e = array();
$r = $this->pipes;
unset($r[0]);


 if (($r || $w) && false === $n = @stream_select($r, $w, $e, 0, $blocking ? Process::TIMEOUT_PRECISION * 1E6 : 0)) {

 
 if (!$this->hasSystemCallBeenInterrupted()) {
$this->pipes = array();
}

return $read;
}

foreach ($r as $pipe) {

 
 $read[$type = array_search($pipe, $this->pipes, true)] = '';

do {
$data = fread($pipe, self::CHUNK_SIZE);
$read[$type] .= $data;
} while (isset($data[0]));

if (!isset($read[$type][0])) {
unset($read[$type]);
}

if ($close && feof($pipe)) {
fclose($pipe);
unset($this->pipes[$type]);
}
}

return $read;
}




public function areOpen()
{
return (bool) $this->pipes;
}









public static function create(Process $process, $input)
{
return new static($process->isTty(), $process->isPty(), $input, $process->isOutputDisabled());
}
}
