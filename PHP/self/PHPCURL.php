<?php 

/*
curl(CommandLine Uniform Resource Locator)



 */



class PHPCURL
{
	/**
     * 使用CURL方式发送post请求
     * @param  $url     [请求地址]
     * @param  $data    [array格式数据]
     * @return $请求返回结果(array)
     */
    public function postDataCurl($url,$data){
        $this->checkSumBuilder();       //发送请求前需先生成checkSum
         
        $timeout = 5000;  
        $http_header = array(
            'AppKey:'.$this->AppKey,
            'Nonce:'.$this->Nonce,
            'CurTime:'.$this->CurTime,
            'CheckSum:'.$this->CheckSum,
            'Content-Type:application/x-www-form-urlencoded;charset=utf-8'
        );
        //print_r($http_header);

        // $postdata = '';
        $postdataArray = array();
        foreach ($data as $key=>$value){
            array_push($postdataArray, $key.'='.urlencode($value));
            // $postdata.= ($key.'='.urlencode($value).'&');
        }
        $postdata = join('&', $postdataArray);

        $ch = curl_init(); 
        curl_setopt ($ch, CURLOPT_URL, $url);
        curl_setopt ($ch, CURLOPT_POST, 1);
        curl_setopt ($ch, CURLOPT_POSTFIELDS, $postdata);
        curl_setopt ($ch, CURLOPT_HEADER, false ); 
        curl_setopt ($ch, CURLOPT_HTTPHEADER,$http_header);
        curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER,false); //处理http证书问题  
        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout); 
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        
        $result = curl_exec($ch);  
        if (false === $result) {
            $result =  curl_errno($ch);
        }
        curl_close($ch);    
        return $this->json_to_array($result) ;
    }

    /**
     * 使用FSOCKOPEN方式发送post请求
     * @param  $url     [请求地址]
     * @param  $data    [array格式数据]
     * @return $请求返回结果(array)
     */
    public function postDataFsockopen($url,$data){
        $this->checkSumBuilder();       //发送请求前需先生成checkSum
         
        // $postdata = '';
        $postdataArray = array();
        foreach ($data as $key=>$value){
            array_push($postdataArray, $key.'='.urlencode($value));
            // $postdata.= ($key.'='.urlencode($value).'&');
        }
        $postdata = join('&', $postdataArray);
        // building POST-request: 
        $URL_Info=parse_url($url);
        if(!isset($URL_Info["port"])){  
            $URL_Info["port"]=80;  
        }  
        $request = ''; 
        $request.="POST ".$URL_Info["path"]." HTTP/1.1\r\n";  
        $request.="Host:".$URL_Info["host"]."\r\n";   
        $request.="Content-type: application/x-www-form-urlencoded;charset=utf-8\r\n";  
        $request.="Content-length: ".strlen($postdata)."\r\n";  
        $request.="Connection: close\r\n"; 
        $request.="AppKey: ".$this->AppKey."\r\n"; 
        $request.="Nonce: ".$this->Nonce."\r\n"; 
        $request.="CurTime: ".$this->CurTime."\r\n"; 
        $request.="CheckSum: ".$this->CheckSum."\r\n";  
        $request.="\r\n";  
        $request.=$postdata."\r\n";  
        
        // print_r($request);
        $fp = fsockopen($URL_Info["host"],$URL_Info["port"]);  
        fputs($fp, $request); 
        $result = '';
        while(!feof($fp)) { 
            $result .= fgets($fp, 128);   
        }  
        fclose($fp);

        $str_s = strpos($result,'{');   
        $str_e = strrpos($result,'}'); 
        $str = substr($result, $str_s,$str_e-$str_s+1);
        return $this->json_to_array($str);
    }

    /**
     * 使用CURL方式发送post请求（JSON类型）
     * @param  $url 	[请求地址]
     * @param  $data    [array格式数据]
     * @return $请求返回结果(array)
     */
    public function postJsonDataCurl($url,$data){
    	$this->checkSumBuilder();		//发送请求前需先生成checkSum
		 
		$timeout = 5000;  
        $http_header = array(
            'AppKey:'.$this->AppKey,
            'Nonce:'.$this->Nonce,
            'CurTime:'.$this->CurTime,
            'CheckSum:'.$this->CheckSum,
            'Content-Type:application/json;charset=utf-8'
        );
        //print_r($http_header);

        $postdata = json_encode($data);

		$ch = curl_init(); 
		curl_setopt ($ch, CURLOPT_URL, $url);
        curl_setopt ($ch, CURLOPT_POST, 1);
        curl_setopt ($ch, CURLOPT_POSTFIELDS, $postdata);
        curl_setopt ($ch, CURLOPT_HEADER, false ); 
		curl_setopt ($ch, CURLOPT_HTTPHEADER,$http_header);
		curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER,false); //处理http证书问题  
        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout); 
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        
		$result = curl_exec($ch);  
        if (false === $result) {
            $result =  curl_errno($ch);
        }
		curl_close($ch);  	
		return $this->json_to_array($result) ;
    }

    /**
     * 使用FSOCKOPEN方式发送post请求（json）
     * @param  $url     [请求地址]
     * @param  $data    [array格式数据]
     * @return $请求返回结果(array)
     */
    public function postJsonDataFsockopen($url, $data){
        $this->checkSumBuilder();       //发送请求前需先生成checkSum

        $postdata = json_encode($data);

        // building POST-request: 
        $URL_Info=parse_url($url);
        if(!isset($URL_Info["port"])){  
            $URL_Info["port"]=80;  
        }  
        $request = ''; 
        $request.="POST ".$URL_Info["path"]." HTTP/1.1\r\n";  
        $request.="Host:".$URL_Info["host"]."\r\n";   
        $request.="Content-type: application/json;charset=utf-8\r\n";  
        $request.="Content-length: ".strlen($postdata)."\r\n";  
        $request.="Connection: close\r\n"; 
        $request.="AppKey: ".$this->AppKey."\r\n"; 
        $request.="Nonce: ".$this->Nonce."\r\n"; 
        $request.="CurTime: ".$this->CurTime."\r\n"; 
        $request.="CheckSum: ".$this->CheckSum."\r\n";  
        $request.="\r\n";  
        $request.=$postdata."\r\n";  
        
        print_r($request);
        $fp = fsockopen($URL_Info["host"],$URL_Info["port"]);  
        fputs($fp, $request); 
        $result = '';
        while(!feof($fp)) { 
            $result .= fgets($fp, 128);   
        }  
        fclose($fp);

        $str_s = strpos($result,'{');   
        $str_e = strrpos($result,'}'); 
        $str = substr($result, $str_s,$str_e-$str_s+1);
        return $this->json_to_array($str);
    }
}