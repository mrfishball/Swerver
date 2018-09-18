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
    
    public func statusLineToHeaderItem() -> String {
        return HttpResponse.HTTP_VERSION + HttpResponse.SPACE + self.statusCode + HttpResponse.SPACE + self.statusPhrase + HttpResponse.LINE_SEPARATOR
    }
    
    public func getContentType() -> String {
        return headerComponents["Content-Type"]!
    }
    
    public func contentTypeToHeaderItem() -> String {
        return "Content-Type: \(self.getContentType())" + HttpResponse.LINE_SEPARATOR
    }
    
    public func getResponseDateTime() -> String {
        return headerComponents["Date"]!
    }
    
    public func dateTimeToHeaderItem() -> String {
        return "Date: \(self.getResponseDateTime())" + HttpResponse.LINE_SEPARATOR
    }
    
    public func responseDataToString() -> String {
        let body = HttpResponse.LINE_SEPARATOR + "<h1>\(statusCode) \(statusPhrase)</h1>"
        return self.statusLineToHeaderItem() + self.contentTypeToHeaderItem() + self.dateTimeToHeaderItem() + body
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
            lhs.headerComponents == rhs.headerComponents
        
    }
}
