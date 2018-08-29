let port = 5050
let server = EchoServer(port: port)
print("Echo Server")
print("Connect with a browser by enter the URL 'localhost:\(port)'")
print("Connect with a command line window by entering 'telnet ::1 \(port)'")

try server.start()
