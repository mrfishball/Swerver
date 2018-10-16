import Foundation
import Swerver

let port = 5000
let server = Swerver(port: port)
print("Dummy Server")
print("Connect with a browser by enter the URL 'localhost:\(port)'")
print("Connect with a command line window by entering 'telnet localhost \(port)'")

try server.start()
