public class HttpResponseBuilder {
    
    public let responseContentType: String = "Content-Type: text/html\n\n"
    
    public init() {}
    
    public func build(header: String, payload: String) -> String {
        let responseHeader: String = "HTTP/1.1 \(header)\n"
        let responseBody: String = payload
        
        let response: String = responseHeader + responseContentType + responseBody
        return response
    }
}
