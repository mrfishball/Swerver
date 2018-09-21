import Foundation

public class ResponseBuilder {
    private(set) var statusCode: String = String()
    private(set) var statusPhrase: String = String()
    private(set) var contentType: String = String()
    private(set) var body: String = String()
    
    public init() {}
    
    public func withStatusCode(statusCode: String) -> ResponseBuilder {
        self.statusCode = statusCode
        return self
    }
    
    public func withStatusPhrase(statusPhrase: String) -> ResponseBuilder {
        self .statusPhrase = statusPhrase
        return self
    }
    
    public func withContentType(contentType: String) -> ResponseBuilder {
        self.contentType = contentType
        return self
    }
    
    public func withBody(body: String) -> ResponseBuilder {
        self.body = body
        return self
    }
    
    public func build() -> HttpResponse {
        return HttpResponse(builder: self)
    }
}
