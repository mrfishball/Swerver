import Foundation

public class HttpResponse {
    
    public static let LINE_SEPARATOR: String = "\r\n"
    public static let SPACE: String = " "
    public static let HTTP_VERSION: String = "HTTP/1.1"
    
    private let statusCode: String
    private let statusPhrase: String
    private var headerComponents: [String: String]
    
    public init(statusCode: String, statusPhrase: String) {
        self.statusCode = statusCode
        self.statusPhrase = statusPhrase
        self.headerComponents = [:]
        self.setContentType()
        self.setDateTime()
    }
    
    public func getContentType() -> String {
        return headerComponents["Content-Type"]!
    }
    
    public func getResponseDateTime() -> String {
        return headerComponents["Date"]!
    }
    
    public func responseDataToString() -> String {
        let responseHeaderString = HttpResponse.HTTP_VERSION + HttpResponse.SPACE + self.statusCode + HttpResponse.SPACE + self.statusPhrase + HttpResponse.LINE_SEPARATOR + self.headerComponentsToString(headerComponents: self.headerComponents) + HttpResponse.LINE_SEPARATOR
        let body = "<h1>\(statusCode) \(statusPhrase)</h1>"
        let responseDataString = responseHeaderString + body
        return responseDataString
    }
    
    private func setContentType() {
        headerComponents["Content-Type"] = "text/html; charset=UTF-8"
    }
    
    private func setDateTime() {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateTimeFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss 'GMT'"
        let currentDateTime: String = dateTimeFormatter.string(from: Date())
        headerComponents["Date"] = currentDateTime
    }
    
    private func headerComponentsToString(headerComponents: [String: String]) -> String {
        var headerComponentString: String = ""
        for (headerKey, headerValue) in headerComponents {
            headerComponentString += headerKey + ": " + headerValue + HttpResponse.LINE_SEPARATOR
        }
        return headerComponentString
    }
}

extension HttpResponse: Equatable {
    public static func == (lhs: HttpResponse, rhs: HttpResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode &&
            lhs.statusPhrase == rhs.statusPhrase &&
            lhs.headerComponents == rhs.headerComponents
        
    }
}
