import Foundation

public class ResponseFormatter {

    public static let HTTP_VERSION: String = HttpVersion.current.rawValue
    public static let LINE_SEPARATOR: String = "\r\n"
    public static let SPACE: String = " "

    public init() {}

    public func format(httpResponse: HttpResponse) -> String {
        let formattedHeader = formatHeader(response: httpResponse)
        if hasBody(response: httpResponse) {
            return formattedHeader + httpResponse.body
        }
        return formattedHeader
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
    
    private func formatHeader(response: HttpResponse) -> String {
        let formattedHeader = statusLineToHeaderItem(response: response) + allHeaderItems(response: response) + dateTimeToHeaderItem(response: response)
        
        return formattedHeader + ResponseFormatter.LINE_SEPARATOR
    }

    private func statusLineToHeaderItem(response: HttpResponse) -> String {
        let statusCode = response.statusCode
        let statusLine = ResponseFormatter.HTTP_VERSION + ResponseFormatter.SPACE +
            statusCode  + ResponseFormatter.SPACE
        
        if let statusPhrase = StatusCode(rawValue: statusCode)?.getStatusPhrase() {
            return statusLine + statusPhrase + ResponseFormatter.LINE_SEPARATOR
        }
        return statusLine + ResponseFormatter.LINE_SEPARATOR
    }
    
    private func dateTimeToHeaderItem(response: HttpResponse) -> String {
        let formattedDateTime = ResponseFormatter.formatDateTime(response: response)
        return "Date: \(formattedDateTime)" + ResponseFormatter.LINE_SEPARATOR
    }
    
    private func allHeaderItems(response: HttpResponse) -> String {
        var allHeaderItemsArray: [String] = []
        for (key, value) in response.headers {
            allHeaderItemsArray.append("\(key.rawValue)\(value)")
        }
        return allHeaderItemsArray.sorted(by: <).joined(separator: ResponseFormatter.LINE_SEPARATOR) + ResponseFormatter.LINE_SEPARATOR
    }
}
