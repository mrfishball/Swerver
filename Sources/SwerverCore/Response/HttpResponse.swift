import Foundation

public class HttpResponse {
    
    private var httpVersion: String = HttpVersion.current.rawValue
    private var statusCode: String
    private var statusPhrase: String
    private var headerComponents: [String: String]
    private var body: String
    
    public init(statusCode: String, statusPhrase: String, body: String) {
        self.statusCode = statusCode
        self.statusPhrase = statusPhrase
        self.headerComponents = [:]
        self.body = body
    }
    
    public static func anEmptyResponse() -> HttpResponse {
        return HttpResponse(statusCode: StatusCode.not_found.rawValue, statusPhrase: StatusCode.not_found.getStatusPhrase(), body: String())
    }
    
    public func getStatusCode() -> String {
        return statusCode
    }
    
    public func getStatusPhrase() -> String {
        return statusPhrase
    }
    
    public func getContentType() -> String {
        return headerComponents["Content-Type"] ?? String()
    }
    
    public func getResponseDateTime() -> String {
        return headerComponents["Date"]!
    }
    
    public func getBody() -> String {
        return body
    }
    
    public func getHttpVersion() -> String {
        return httpVersion
    }
    
    public func getHeaderComponents() -> [String: String] {
        return headerComponents
    }
    
    public func setResponseBody(body: String) -> HttpResponse {
        self.body = body
        return self
    }
    
    public func setResponseStatusCode(statusCode: String) -> HttpResponse {
        self.statusCode = statusCode
        return self
    }
    
    public func setResponseStatusPhrase(statusPhrase: String) -> HttpResponse {
        self.statusPhrase = statusPhrase
        return self
    }
    
    public func setResponseContentType(contentType: String) -> HttpResponse {
        headerComponents["Content-Type"] = contentType
        return self
    }
    
    public func setResponseDateTime(dateTime: String) -> HttpResponse {
        headerComponents["Date"] = dateTime
        return self
    }
}

extension HttpResponse: Equatable {
    public static func == (lhs: HttpResponse, rhs: HttpResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode &&
            lhs.statusPhrase == rhs.statusPhrase &&
            lhs.headerComponents == rhs.headerComponents &&
            lhs.body == rhs.body
    }
}
