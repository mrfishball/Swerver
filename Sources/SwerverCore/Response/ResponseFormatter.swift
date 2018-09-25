import Foundation

public class ResponseFormatter {
    
    public static let LINE_SEPARATOR: String = "\r\n"
    public static let SPACE: String = " "
    
    public init() {}
    
    public func format(httpResponse: HttpResponse) -> String {
        var formattedHeader = formatHeader(response: httpResponse)
        if hasBody(response: httpResponse) {
            return formattedHeader + httpResponse.body
        }
        return formattedHeader
    }
    
    private func formatHeader(response: HttpResponse) -> String {
        var formattedHeader = statusLineToHeaderItem(response: response) + dateTimeToHeaderItem(response: response)
            + contentTypeToHeaderItem(response: response) + contentLengthToHeaderItem(response: response)
        
        if hasAllowedMethods(response: response) {
            formattedHeader += allowedMethodsToHeaderItem(response: response)
        }
        
        return formattedHeader + ResponseFormatter.LINE_SEPARATOR
    }
    
    public static func formatDateTime(response: HttpResponse) -> String {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateTimeFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss 'GMT'"
        
        let formattedDateTime: String = dateTimeFormatter.string(from: response.dateTime)
        
        return formattedDateTime
    }
    
    private func hasBody(response: HttpResponse) -> Bool {
        return response.body.count > 0
    }
    
    private func hasAllowedMethods(response: HttpResponse) -> Bool {
        return response.allowedMethods.count > 0
    }
    
    private func statusLineToHeaderItem(response: HttpResponse) -> String {
        return response.httpVersion + ResponseFormatter.SPACE +
            response.statusCode + ResponseFormatter.SPACE +
            response.statusPhrase + ResponseFormatter.LINE_SEPARATOR
    }
    
    private func contentLengthToHeaderItem(response: HttpResponse) -> String {
        return "Content-Length: \(response.contentLength)" + ResponseFormatter.LINE_SEPARATOR
    }
    
    private func contentTypeToHeaderItem(response: HttpResponse) -> String {
        return "Content-Type: \(response.contentType)" + ResponseFormatter.LINE_SEPARATOR
    }
    
    private func dateTimeToHeaderItem(response: HttpResponse) -> String {
        let formattedDateTime = ResponseFormatter.formatDateTime(response: response)
        return "Date: \(formattedDateTime)" + ResponseFormatter.LINE_SEPARATOR
    }
    
    private func allowedMethodsToHeaderItem(response: HttpResponse) -> String {
        return "Allow: \(response.allowedMethods.joined(separator: ", "))" + ResponseFormatter.LINE_SEPARATOR
    }
}
