github developer 使用记录 
------------------------

1. 下载[curl](http://curl.haxx.se/download.html)  [windows](https://bintray.com/artifact/download/vszakats/generic/curl-7.46.0-win64-mingw.7z)
2. Getting Started
	- `curl https://api.github.com/users/defunkt` 用户主页
	- `curl -i https://api.github.com/users/andyron`  加了head
		+ `X-`开头的自定义http字段
	- authentication 
		1. Basic  
			`curl -i -u andyron https://api.github.com/users/defunkt`  
			`curl -i -u username:password https://api.github.com/users/defunkt`
		2. OAuth
			+ 在页面上生存token `https://github.com/settings/tokens`
			+ 通过接口生成token `curl -i -u your_username -d '{"scopes": ["repo", "user"], "note": "getting-started"}' https://api.github.com/authorizations`  (-d 是POST访问，github的说有POST接口参数都是JSON形式的)

			+ 使用token `curl -i -H 'Authorization: token 5199831f4dd3b79e7c5b7e0ebe75d67aa66e79d4' https://api.github.com/user`  ？？？
			