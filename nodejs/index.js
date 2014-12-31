var server = require("./server2");
var router = require("./router");

server.start(router.route);