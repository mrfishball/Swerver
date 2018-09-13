public class HttpResponse {
    
    public var header: String
    public var payload: String
    public let contentType: String = "Content-Type: text/html\n\n"
    
    public init(header: String, payload: String) {
        self.header = "HTTP/1.1 \(header)\n"
        self.payload = payload
    }
    
    public func toString() -> String {
        return header + contentType + payload
    }
}
