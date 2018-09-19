import Foundation

public class HttpRequestParser {
    
    public init() {}
    
    public func parse(request: String) -> HttpRequest {
        let firstLineOfRequest = request.components(separatedBy: "\r\n")[0]
        let headerComponents = firstLineOfRequest.components(separatedBy: " ")
        let requestMethod = RequestMethods(rawValue: headerComponents[0])
        let url = URL(string: headerComponents[1])
        let httpVersion = HttpVersion(rawValue: headerComponents[2])
        return HttpRequest(method: requestMethod ?? RequestMethods.OTHER,
                           url: url ?? URL(string: "/")! , httpVersion: httpVersion ?? HttpVersion.current)
    }
}