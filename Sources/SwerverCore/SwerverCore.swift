import Foundation
import Socket
import SwiftyBeaver


public class Swerver {
    
    public static let bufferSize = Socket.SOCKET_DEFAULT_READ_BUFFER_SIZE
    
    public let port: Int
    public var listenSocket: Socket? = nil
    public var continueListening = true
    
    let logger = SwiftyBeaver.self
    
    
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
        var readData: Data? = Data(capacity: Swerver.bufferSize)
        
        do {
            repeat {
                let bytesData = try socket.read(into: &readData!)
                
                if bytesData > 0 {
                    guard let request = String(data: readData!, encoding: .utf8) else {
                        print("Error decoding response...")
                        readData!.count = 0
                        break
                    }
                    print(request)
                    let responseHeader: String = "HTTP/1.1 200 OK\n"
                    
                    try socket.write(from: responseHeader)
                    keepRunning = false
                }
                if bytesData == 0 {
                    keepRunning = false
                    break
                }
                readData!.count = 0

            } while keepRunning
        }
        catch let error {
            guard let socketError = error as? Socket.Error else {
                print("Unexpected error occurred...")
                return
            }
            if self.continueListening {
                print("Error: \(socketError.description)")
            }
        }
    }
}
