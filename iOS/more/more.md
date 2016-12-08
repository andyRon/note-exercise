ios 没有特定记录

### 1 Alamofire 使用  **
[参考](http://www.jianshu.com/p/f1208b5e42d9)
-------
1. 基础请求
````
Alamofire.request("https://api.500px.com/v1/photos", method: .get, parameters: ["consumer_key": "请输入您的消费者密钥"]).responseJSON { 
    response in 
    guard let JSON = response.result.value else { return } 
    print("JSON: \(JSON)") 
}
````


### 杂项知识 


