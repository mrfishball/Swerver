import Foundation

public class HttpRequestParser {

    public init() {}

    public func parse(request: String) -> HttpRequest? {

        let firstLineOfRequest = request.components(separatedBy: "\r\n")[0]
        let headerComponents = firstLineOfRequest.components(separatedBy: " ")

        if let requestMethod = RequestMethod(rawValue: headerComponents[0]),
            let url = URL(string: headerComponents[1]) {

            return HttpRequest(method: requestMethod, url: url)
        }
        return nil
    }
}
