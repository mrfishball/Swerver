import Foundation

public class HttpRequest {
    
    var request: String
    
    public init(request: String) {
        self.request = request
    }
    
    public func toString() -> String {
        return request
    }
}

extension HttpRequest: Equatable {
    public static func == (lhs: HttpRequest, rhs: HttpRequest) -> Bool {
        return lhs.request == rhs.request
    }
}
