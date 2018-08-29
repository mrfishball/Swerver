import Foundation
import Socket


public class EchoServer {
    
    public static let quitCommand: String = "QUIT"
    public static let bufferSize = Socket.SOCKET_DEFAULT_READ_BUFFER_SIZE
    
    public let port: Int
    public var listenSocket: Socket? = nil
    public var continueListening = true
    
    public init(port: Int) {
        self.port = port
    }
    
    public func start() throws {
        let socket = try Socket.create()
        
        listenSocket = socket
        try socket.listen(on: port)
        print("Listening on port: \(socket.listeningPort)\n")
        repeat {
            let connectedSocket = try socket.acceptClientConnection()
            print("Connection from: \(connectedSocket.remoteHostname)\n")
            newConnection(socket: connectedSocket)
            
        } while continueListening
    }
    
    private func newConnection(socket: Socket) {
        
        var keepRunning = true
        var readData: Data? = Data(capacity: EchoServer.bufferSize)
        
        do {
            try socket.write(from: "Hi!, type 'QUIT' to end session and stop the server.\n")
            
            repeat {
                let bytesData = try socket.read(into: &readData!)
                
                if bytesData > 0 {
                    guard let request = String(data: readData!, encoding: .utf8) else {
                        print("Error decoding response...")
                        readData!.count = 0
                        break
                    }
                    print(request)
                    print("Repsonse: 200 OK\n")
                    
                    if request.hasPrefix(EchoServer.quitCommand) {
                        keepRunning = false
                    }
                    let reply = "Server says: \n\(request)\n"
                    try socket.write(from: "\n\(reply)")
                    
                }
                if bytesData == 0 {
                    keepRunning = false
                    break
                }

            } while keepRunning
        }
        catch let error {
            guard let socketError = error as? Socket.Error else {
                print("Unexpected error occured...")
                return
            }
            if self.continueListening {
                print("Error: \(socketError.description)")
            }
        }
    }
}
