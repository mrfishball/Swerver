import Foundation
import Socket
import SwiftyBeaver


public class Swerver {
    
    public static let quitCommand: String = "QUIT"
    public static let bufferSize = Socket.SOCKET_DEFAULT_READ_BUFFER_SIZE
    
    public let port: Int
    public var listenSocket: Socket? = nil
    public var continueListening = true
    
    let logger = SwiftyBeaver.self
    let console = ConsoleDestination()
    
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
            let connectedSocket = try socket.acceptClientConnection()
            logger.info("Connection from: \(connectedSocket.remoteHostname)\n")
            newConnection(socket: connectedSocket)
            
        } while continueListening
    }
    
    private func newConnection(socket: Socket) {
        
        var keepConnectionAlive = true
        let responseHeader: String = "HTTP/1.1 200 OK\n"
        let responseContentType: String = "Content-Type: text/html\n\n"
        var responseBody: String = ""
        var readData: Data? = Data(capacity: Swerver.bufferSize)
        
        do {
            repeat {
                let bytesData = try socket.read(into: &readData!)
                
                if bytesData > 0 {
                    guard let request = String(data: readData!, encoding: .utf8) else {
                        logger.error("Error decoding response...")
                        readData!.count = 0
                        break
                    }
                    logger.debug(request)
                    if request.hasPrefix(Swerver.quitCommand) {
                        logger.warning("Shutting down swerver...")
                        keepConnectionAlive = false
                    }
                    if request.hasPrefix(Swerver.quitCommand) {
                        keepConnectionAlive = false
                    } else {
                        responseBody = """
                        <html>
                        <body>
                        <b>Welcome to the dummy Swerver!</b>
                        </body>
                        </html>
                        """
                    }
                    
                    try socket.write(from: responseHeader + responseContentType + responseBody)
                    keepConnectionAlive = false
                }
                if bytesData == 0 {
                    logger.debug("bytesData is 0")
                    keepConnectionAlive = false
                }
                readData!.count = 0

                logger.debug("Keep alive - \(keepConnectionAlive)")
            } while keepConnectionAlive
            
            logger.debug("Socket: \(socket.remoteHostname):\(socket.remotePort) closed...")
            socket.close()
        }
        catch let error {
            guard let socketError = error as? Socket.Error else {
                logger.error("Unexpected error occurred...")
                return
            }
            if self.continueListening {
                logger.error("Error: \(socketError.description)")
            }
        }
    }
}
