var http = require("http");

// console.log(http)
function onRequest(request,response){
	console.log('request start')
	response.writeHead(200,{"Content-Type":"text/plain"});
	response.write("hello world");
	response.end();
} 

http.createServer(onRequest).listen(8888);
console.log('server listening.');
