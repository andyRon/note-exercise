<?php
/*
实现当访客在博客上发表评论后，向博文的作者发送Email的功能
*/
// 为邮件服务定义抽象层
interface  EmailSenderInterface
{
	public function send(...);
}
//定义Gmail邮件服务
class GmailSender implements EmailSenderInterface
{
	public function send(...){

	}
}
// 定义评论类	构造函数注入
class Comment extend yii\db\ActiveRecord
{
	private $_eMailSender;

	public function __contruct($emailSender){

		$this->_eMailSender = $emailSender;
	}
	public function afterInsert(){
		$this->_eMailSender->send();
	}
}

$sender1 = new GmailSender();

$comment1 = new Comment($sender1);
$comment1.save();


// 定义评论类	属性注入
class Comment extend yii\db\ActiveRecord
{
	private $_eMailSender;
	public function setEmailSender($value){
		$this->_eMailSender = $value;
	}
	public function afterInsert(){
		$this->_eMailSender->send(...);
	}
}