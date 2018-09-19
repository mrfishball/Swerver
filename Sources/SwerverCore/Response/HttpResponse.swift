import Foundation

public class HttpResponse {
    
    private let statusCode: String
    private let statusPhrase: String
    private var headerComponents: [String: String]
    private let body: String
    
    public init(statusCode: String, statusPhrase: String, body: String) {
        self.statusCode = statusCode
        self.statusPhrase = statusPhrase
        self.headerComponents = [:]
        self.body = body
        self.setContentType()
        self.setDateTime()
    }
    
    public func getStatusCode() -> String {
        return statusCode
    }
    
    public func getStatusPhrase() -> String {
        return statusPhrase
    }
    
    public func getContentType() -> String {
        return headerComponents["Content-Type"]!
    }
    
    public func getResponseDateTime() -> String {
        return headerComponents["Date"]!
    }
    
    public func getBody() -> String {
        return body
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
}

extension HttpResponse: Equatable {
    public static func == (lhs: HttpResponse, rhs: HttpResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode &&
            lhs.statusPhrase == rhs.statusPhrase &&
            lhs.headerComponents == rhs.headerComponents &&
            lhs.body == rhs.body
        
    }
}
