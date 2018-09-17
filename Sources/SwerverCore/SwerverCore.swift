import Foundation
import Socket
import SwiftyBeaver

let logger = SwiftyBeaver.self

public class Swerver {
    
    public static let bufferSize = Socket.SOCKET_DEFAULT_READ_BUFFER_SIZE
    
    private let port: Int
    private var listenSocket: Socket!
    private var continueListening = true
    
    private let clientRequestHandler = ClientRequestHandler()
    private let console = ConsoleDestination()
    
    public init(port: Int) {
        self.port = port
        logger.addDestination(console)
    }
    
    public func start() throws {
        let socket = try Socket.create()
        listenSocket = socket
        try socket.listen(on: port)
        logger.info("Listening on port: \(socket.listeningPort)\n")
        repeat {
            try newConnection(socket: socket)
        } while true
    }
    
    private func newConnection(socket: Socket) throws {
        let connectedSocket = try socket.acceptClientConnection()
        logger.info("Connected to client: \(connectedSocket.remoteHostname)")
        let _ = try clientRequestHandler.handle(client: connectedSocket)
        connectedSocket.close()
    }
}
