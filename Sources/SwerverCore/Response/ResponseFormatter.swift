import Foundation

public class ResponseFormatter {
    
    public static let LINE_SEPARATOR: String = "\r\n"
    public static let SPACE: String = " "
    
    public init() {}
    
    public func format(httpResponse: HttpResponse) -> String {
        return formatHeader(response: httpResponse) + httpResponse.body
    }
    
    private func formatHeader(response: HttpResponse) -> String {
        let statusLine = statusLineToHeaderItem(response: response)
        let dateTime = dateTimeToHeaderItem(response: response)
        let contentType = contentTypeToHeaderItem(response: response)
        let contentLength = contentLengthToHeaderItem(response: response)
        
        let formattedHeader = (statusLine + dateTime + contentType + contentLength + ResponseFormatter.LINE_SEPARATOR)
        return formattedHeader
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
    
    public static func formatDateTime(response: HttpResponse) -> String {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateTimeFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss 'GMT'"
        
        let formattedDateTime: String = dateTimeFormatter.string(from: response.dateTime)
        
        return formattedDateTime
    }
}
