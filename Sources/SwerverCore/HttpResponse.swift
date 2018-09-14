public class HttpResponse {
    
    var header: String
    var payload: String
    let contentType: String = "Content-Type: text/html\n\n"
    
    public var response: String!
    
    public init(header: String, payload: String) {
        self.header = "HTTP/1.1 \(header)\n"
        self.payload = payload
    }
    
    public func toString() -> String {
        return header + contentType + payload
    }
}

extension HttpResponse: Equatable {
    public static func == (lhs: HttpResponse, rhs: HttpResponse) -> Bool {
        return (lhs.header == rhs.header) && (lhs.payload == rhs.payload)
        
    }
}
