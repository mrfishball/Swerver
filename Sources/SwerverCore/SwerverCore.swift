import Socket

public class EchoServer {
    
    public static let quitCommand: String = "QUIT"
    public static let shutdownCommand: String = "SHUTDOWN"
    public static let bufferSize = Socket.SOCKET_DEFAULT_READ_BUFFER_SIZE
    
    public let port: Int
    public var listenSocket: Socket? = nil
    public var continueRunning = true
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
    
}
