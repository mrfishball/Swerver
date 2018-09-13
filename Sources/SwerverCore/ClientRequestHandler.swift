import Foundation
import Socket

public class ClientRequestHandler {
    
    private let httpRequestParser = HttpRequestParser()
    private let httpRouteProcessor = Router()
    
    public init() {}
    
    public func handle(client: Socket) throws {
        let httpRequest = try parseRequest(clientSocket: client)
        try client.write(from: httpRouteProcessor.process(request: httpRequest).toString())
    }
    
    private func parseRequest(clientSocket: Socket) throws -> HttpRequest {
        var readData: Data? = Data(capacity: Swerver.bufferSize)
        let _ = try clientSocket.read(into: &readData!)
        guard let parsedData = String(data: readData!, encoding: .utf8) else {
            readData!.count = 0
            logger.info("Error decoding socket data")
            return httpRequestParser.parse(request: "")
        }
        readData!.count = 0
        return httpRequestParser.parse(request: parsedData)
    }
}
