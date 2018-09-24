import Foundation

public class HttpRequest {
    
    private let method: RequestMethod
    private let url: URL
    private let httpVersion: HttpVersion
    
    public init(method: RequestMethod, url: URL, httpVersion: HttpVersion) {
        self.method = method
        self.url = url
        self.httpVersion = httpVersion
    }
    
    public func getMethod() -> RequestMethod {
        return method
    }
    
    public func getUrl() -> URL {
        return url
    }
    
    public func getHttpVersion() -> HttpVersion {
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
