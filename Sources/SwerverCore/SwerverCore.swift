import Foundation
import Socket


public class EchoServer {
    
    public static let quitCommand: String = "QUIT"
    public static let shutdownCommand: String = "SHUTDOWN"
    public static let bufferSize = Socket.SOCKET_DEFAULT_READ_BUFFER_SIZE
    
    public let port: Int
    public var listenSocket: Socket? = nil
    public var continueListening = true
    public var connectedSockets = [Int32: Socket]()
    
    public init(port: Int) {
        self.port = port
    }
    
    deinit {
        for socket in connectedSockets.values {
            socket.close()
        }
        self.listenSocket?.close()
    }
    
    public func start() throws {
        let socket = try Socket.create()
        
        listenSocket = socket
        try socket.listen(on: port)
        print("Listening on port: \(socket.listeningPort)")
        repeat {
            let connectedSocket = try socket.acceptClientConnection()
            print("Connection from: \(connectedSocket.remoteHostname)")
            newConnection(socket: connectedSocket)
            
        } while continueListening
    }
    
    private func newConnection(socket: Socket) {
        connectedSockets[socket.socketfd] = socket
        
        var keepRunning = true
        var readData = Data(capacity: EchoServer.bufferSize)
        
        do {
            try socket.write(from: "Hi!, type 'QUIT' to end session or 'SHUTDOWN' to stop server.\n")
            
            repeat {
                let bytesData = try socket.read(into: &readData)
                
                if bytesData > 0 {
                    guard let response = String(data: readData, encoding: .utf8) else {
                        print("Error decoding response...")
                        readData.count = 0
                        break
                    }
                    if response.hasPrefix(EchoServer.quitCommand) || response.hasPrefix(EchoServer.shutdownCommand) {
                        keepRunning = false
                    }
                    
                    let reply = "Server response: \n\(response)\n"
                    try socket.write(from: reply)
                }
                if bytesData == 0 {
                    keepRunning = false
                    break
                }
                
                readData.count = 0
                
            } while keepRunning
            
            print("Connection closed...")
            socket.close()
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
//
//    private func shutdownServer() {
//        print("Shutting down server...")
//        continueListening = false
//    }
//
}
