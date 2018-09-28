import Foundation

public class HttpRequestParser {
    
    public init() {}
    
    public func parse(request: String) -> HttpRequest {
        
        let firstLineOfRequest = request.components(separatedBy: "\r\n")[0]
        let headerComponents = firstLineOfRequest.components(separatedBy: " ")
        let requestMethod: RequestMethod? = RequestMethod(rawValue: headerComponents[0])
        let url: URL = URL(string: headerComponents[1])!
        let httpVersion: HttpVersion? = HttpVersion(rawValue: headerComponents[2])
        return HttpRequest(method: requestMethod ?? RequestMethod.invalid, url: url, httpVersion: httpVersion ?? HttpVersion.current)
    }
}
