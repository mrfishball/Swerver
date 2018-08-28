import Socket

class EchoServer {
    
    static let quitCommand: String = "QUIT"
    static let shutdownCommand: String = "SHUTDOWN"
    static let bufferSize = Socket.SOCKET_DEFAULT_READ_BUFFER_SIZE
    
    let port: Int
    var listenSocket: Socket? = nil
    var continueRunning = true
    var connectedSockets = [Int32: Socket]()
    
    init(port: Int) {
        self.port = port
    }
    
    deinit {
        for socket in connectedSockets.values {
            socket.close()
        }
        self.listenSocket?.close()
    }
    
}
