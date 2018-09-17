import Foundation

public class HttpRequest {
    
    private let method: String
    private let url: String
    private let httpVersion: String
    
    public init(method: String, url: String, httpVersion: String) {
        self.method = method
        self.url = url
        self.httpVersion = httpVersion
    }
    
    public func getMethod() -> String {
        return method
    }
    
    public func getUrl() -> String {
        return url
    }
    
    public func getHttpVersion() -> String {
        return httpVersion
    }
}

extension HttpRequest: Equatable {
    public static func == (lhs: HttpRequest, rhs: HttpRequest) -> Bool {
        return lhs.method == rhs.method &&
            lhs.url == rhs.url &&
            lhs.httpVersion == rhs.httpVersion
    }
}
