import Foundation

public class HttpRequest {
    
    public var request: String
    
    public init(request: String) {
        self.request = request
    }
    
    public func toString() -> String {
        return self.request
    }
}
