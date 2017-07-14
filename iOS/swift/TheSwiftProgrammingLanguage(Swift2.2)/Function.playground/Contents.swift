
func test(to innerto:String, for innerfor:String) -> String {
    return innerto+innerfor+"合成";
}

test(to: "a", for: "b")

func test2(p:Int)->Int{
    return p;
}
test2(2)

//Success()

import Foundation

//var url = NSURL(fileURLWithPath: "/Users/andyron/myfield/", isDirectory: true)

//let url = NSURL(string: "www.baidu.com")

//let urlPath: String = "www.baidu.com"
//let url: NSURL = NSURL(string: urlPath)!
//let request1: NSURLRequest = NSURLRequest(URL: url)
//let queue:NSOperationQueue = NSOperationQueue()
//
//NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
//    
//    do {
//        if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
//            print("ASynchronous\(jsonResult)")
//        }
//    } catch let error as NSError {
//        print(error.localizedDescription)
//    }
//    
//    
//})


func getScore(){
    
    let urlString:String="http://www.baidu.com"
    var url:NSURL!
    url = NSURL(string:urlString)
    let request = NSMutableURLRequest(URL:url)
    request.HTTPMethod = "GET"
    
    //响应对象
    var response:NSURLResponse?
    
    do{
        //发出请求
        let received:NSData? = try NSURLConnection.sendSynchronousRequest(request,
                                                                          returningResponse: &response)
        let datastring = NSString(data:received!, encoding: NSUTF8StringEncoding)
        print(datastring)
        
    }catch let error as NSError{
        //打印错误消息
        print(error.code)
        print(error.description)
    }
}

//getScore()

func defaultParam(dp: Int = 1) {
    print(dp);
}
defaultParam()
//defaultParam(12)

func `func`() {
    
}
`func`()
