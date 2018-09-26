import Foundation

public class ResponseBuilder {
    private(set) var statusCode: String = String()
    private(set) var statusPhrase: String = String()
    private(set) var contentType: String = String()
    private(set) var body: String = String()
    private(set) var contentLength: Int = 0
    private(set) var allowedMethods: [String] = []
    
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
    
    public func withContentLength(contentLength: Int) -> ResponseBuilder {
        self.contentLength = contentLength
        return self
    }
    
    public func withAllowedMethods(allowedMethods: [String]) -> ResponseBuilder {
        self.allowedMethods = allowedMethods.sorted(by: <)
        return self
    }
    
    public func build() -> HttpResponse {
        return HttpResponse(builder: self)
    }
}
