import Foundation

public class HttpRequestParser {
    
    public init() {}
    
    public func parse(request: String) throws -> HttpRequest {
        
        var requestMethod: RequestMethod
        var url: URL
        var httpVersion: HttpVersion
        
        if validRequestSize(request: request) {
            let headerComponents = request.components(separatedBy: "\r\n")[0].components(separatedBy: " ")
        
            if validHeaderSize(headerComponents: headerComponents) {
                
                do {
                    try requestMethod = extractRequestMethod(headerComponents: headerComponents)
                    try url = extractRequestURL(headerComponents: headerComponents)
                    try httpVersion = extractHttpVersion(headerComponents: headerComponents)
                    
                    return HttpRequest(method: requestMethod, url: url, httpVersion: httpVersion)
                
                } catch {}
            }
        }
        throw ServerError.parserError(reason: "Invalid request format")
    }
    
    private func extractRequestMethod(headerComponents: [String]) throws -> RequestMethod {
        guard let extractedRequestMethod = RequestMethod(rawValue: headerComponents[0]) else {
            throw ServerError.parserError(reason: "Invalid request method")
        }
        return extractedRequestMethod
    }
    
    private func extractRequestURL(headerComponents: [String]) throws -> URL {
        guard let constructedUrl = URL(string: headerComponents[1]) else {
            throw ServerError.parserError(reason: "Invalid request URL")
        }
        return constructedUrl
    }
    
    private func extractHttpVersion(headerComponents: [String]) throws -> HttpVersion {
        guard let extractedHttpVersion = HttpVersion(rawValue: headerComponents[2]) else {
            throw ServerError.parserError(reason: "Invalid HTTP version")
        }
        return extractedHttpVersion
    }
    
    private func validRequestSize(request: String) -> Bool {
        return request.count >= 14
    }
    
    private func validHeaderSize(headerComponents: [String]) -> Bool {
        return headerComponents.count == 3
    }
}
