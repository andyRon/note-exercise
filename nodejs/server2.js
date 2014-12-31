var http = require("http")
var url = require("url")

function start(){
	function onRequest(request,response){
		var pathname = url.parse(request.url).pathname
		console.log('request for "'+ pathname + '" received.')
		response.writeHead(200,{"Content-Type":"text/plain"});
		response.write("hello world");
		response.end();
	}
	http.createServer(onRequest).listen(8888);
	console.log('server listening.');
}

exports.start = start;