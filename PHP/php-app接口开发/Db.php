<?php

class Db{
	static private $_instance;
	static private $_connect;
	private $_dbConfig = array(
		'host' => '',
		'user' => 'root',
		'password' => '',
		'database' => ''
	);

	private function __construct(){

	}

	static public function getInstance(){
		if(!(self::$_instance instanceof self)){
			self::$_instance = new self();
		}

		return self::$_instance;
	}


	public  function connect(){
		if(!self::$_connectSource){
			self::$_connectSource = mysql_connect($this->_dbConfig['host'],$this->_dbConfig['user'],$this->_dbConfig['password']);

			if(!self::$_connectSource){
				die('mysql connect error '.mysql_error());
			}

			mysql_select_db($this->_dbConfig['database'], self::$_connectSource);
			mysql_query("set names UTF8", self::$_connectSource);
		}
		return self::$_connectSource;
	}
}