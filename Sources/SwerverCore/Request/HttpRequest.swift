import Foundation

public class HttpRequest {
    
    private let method: RequestMethod
    private let url: URL
    
    public init(method: RequestMethod, url: URL) {
        self.method = method
        self.url = url
    }
    
    public func getMethod() -> RequestMethod {
        return method
    }
    
    public func getUrl() -> URL {
        return url
    }
}

extension HttpRequest: Equatable {
    public static func == (lhs: HttpRequest, rhs: HttpRequest) -> Bool {
        return lhs.method == rhs.method &&
            lhs.url == rhs.url
    }
}
