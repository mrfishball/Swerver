import Foundation
import Socket

public class HttpConnection {
    
    private let httpRequestParser: HttpRequestParser
    private let httpResponseFormatter: HttpResponseFormatter
    private let router: Router
    
    public init(router: Router,
                httpResponseFormatter: HttpResponseFormatter,
                httpRequestParser: HttpRequestParser) {

        self.router = router
        self.httpRequestParser = httpRequestParser
        self.httpResponseFormatter = httpResponseFormatter
    }
    
    public func handle(client: Socket, host: String) throws {
        let httpRequest = try parseRequest(clientSocket: client)
        httpResponseFormatter.setHost(host: host)
        try client.write(from: httpResponseFormatter.format(httpResponse: router.process(request: httpRequest)))
    }
    
    private func parseRequest(clientSocket: Socket) throws -> HttpRequest? {
        var readData: Data = Data(capacity: Swerver.bufferSize)
        let _ = try clientSocket.read(into: &readData)
        if let parsedData = String(data: readData, encoding: .utf8) {
            readData.count = 0
            logger.info(parsedData)
            return httpRequestParser.parse(request: parsedData)
        } else {
            readData.count = 0
            logger.info("Error decoding socket data")
            return httpRequestParser.parse(request: "")
        }
    }
}
