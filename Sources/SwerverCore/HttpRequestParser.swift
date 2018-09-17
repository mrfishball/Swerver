import Foundation

public class HttpRequestParser {
    
    public init() {}
    
    public func parse(request: String) -> HttpRequest {
        let firstLineOfRequest = request.components(separatedBy: "\r\n")[0]
        let headerComponents = firstLineOfRequest.components(separatedBy: " ")
        let requestMethod = headerComponents[0]
        let url = headerComponents[1]
        let httpVersion = headerComponents[2]
        return HttpRequest(method: requestMethod, url: url, httpVersion: httpVersion)
    }
}
