#Web Pressure Test

Web Pressure Test(WPT)是一个在Linux下使用的非常简单的网站压测工具。它使用fork()模拟多个客户端访问设定的URL，测试网站在压力下工作的性能，最多可以模拟3万个并发连接去测试网站的负载能力。


##使用：
	sudo make && make install

##命令行选项：
	wpt [options]

|short|long|function|
|:--------|:--------------------- |:----------------------------------------------|
|-f       |--force                |Don't wait for reply from server.              |
|-r       |--reload               |Send reload request - Pragma: no-cache.        |
|-t       |--time <sec>           |Run benchmark for <sec> seconds. Default 30.   |
|-p       |--proxy <server:port>  |Use proxy server for request.                  |
|-c       |--clients <n>          |Run <n> HTTP clients at once. Default one.     |
|-9       |--http09               |Use HTTP/0.9 style requests.                   |
|-1       |--http10               |Use HTTP/1.0 protocol.                         |
|-2       |--http11               | Use HTTP/1.1 protocol.                        |
|         |--get                  |Use GET request method.                        |
|         |--head                 |Use HEAD request method.                       |
|         |--options              |Use OPTIONS request method.                    |
|         |--trace                |Use TRACE request method.                      |
|-?/-h    |--help                 |This information.                              |
|-V       |--version              |Display program version.                       |

##更多信息：
参见博客: http://e29.github.io/
