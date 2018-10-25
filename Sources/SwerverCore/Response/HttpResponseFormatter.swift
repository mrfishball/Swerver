import Foundation

public class HttpResponseFormatter {

    public static let HTTP_VERSION: String = HttpVersion.current.rawValue
    public static let LINE_SEPARATOR: String = "\r\n"
    public static let SPACE: String = " "
    private var host: String = String()

    public init() {}

    public func format(httpResponse: HttpResponse) -> String {
        let formattedHeader = formatHeader(response: httpResponse)
        if hasBody(response: httpResponse) {
            return formattedHeader + httpResponse.body
        }
        return formattedHeader
    }

    public func setHost(host: String) {
        self.host = host
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
        
        return formattedHeader + HttpResponseFormatter.LINE_SEPARATOR
    }

    private func statusLineToHeaderItem(response: HttpResponse) -> String {
        let statusCode = response.statusCode
        let statusLine = HttpResponseFormatter.HTTP_VERSION + HttpResponseFormatter.SPACE +
            statusCode  + HttpResponseFormatter.SPACE
        
        if let statusPhrase = StatusCode(rawValue: statusCode)?.getStatusPhrase() {
            return statusLine + statusPhrase + HttpResponseFormatter.LINE_SEPARATOR
        }
        return statusLine + HttpResponseFormatter.LINE_SEPARATOR
    }
    
    private func allHeaderItems(response: HttpResponse) -> String {
        var allHeaderItemsArray: [String] = []
        for (key, value) in response.headers {
            if key == ResponseHeader.location {
                allHeaderItemsArray.append("\(key.rawValue): \(host)\(value)")
            } else {
                allHeaderItemsArray.append("\(key.rawValue): \(value)")
            }
        }
        return allHeaderItemsArray.sorted(by: <).joined(separator: HttpResponseFormatter.LINE_SEPARATOR) + HttpResponseFormatter.LINE_SEPARATOR
    }

    private func dateTimeToHeaderItem(response: HttpResponse) -> String {
        let formattedDateTime = HttpResponseFormatter.formatDateTime(response: response)
        return "Date: \(formattedDateTime)" + HttpResponseFormatter.LINE_SEPARATOR
    }
}
