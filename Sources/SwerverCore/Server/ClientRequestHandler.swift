import Foundation
import Socket

public class ClientRequestHandler {
    
    private let httpRequestParser = HttpRequestParser()
    private let httpRouteProcessor = Router()
    
    public init() {}
    
    public func handle(client: Socket) throws {
        do {
            let httpRequest = try parseRequest(clientSocket: client)
            try client.write(from: httpRouteProcessor.process(request: httpRequest))
        } catch ServerError.parserError(let reason) {
            logger.error(reason)
            client.close()
        }
    }
    
    private func parseRequest(clientSocket: Socket) throws -> HttpRequest {
        var readData: Data? = Data(capacity: Swerver.bufferSize)
        let _ = try clientSocket.read(into: &readData!)
        guard let parsedData = String(data: readData!, encoding: .utf8) else {
            readData!.count = 0
            logger.info("Error decoding socket data")
            do {
                return try httpRequestParser.parse(request: "")
            } catch ServerError.parserError(let reason) {
                throw ServerError.parserError(reason: reason)
            }
        }
        readData!.count = 0
        logger.info(parsedData)
        return try httpRequestParser.parse(request: parsedData)
    }
}
