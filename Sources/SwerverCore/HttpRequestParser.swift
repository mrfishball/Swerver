import Foundation

public class HttpRequestParser {
    
    public init() {}
    
    public func parse(request: String) -> HttpRequest {
        
        return HttpRequest(request: request)
    }
}
