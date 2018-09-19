public class ResponseFormatter {
    
    public static let LINE_SEPARATOR: String = "\r\n"
    public static let SPACE: String = " "
    public static let HTTP_VERSION: HttpVersion = HttpVersion.current
    
    public init() {}
    
    public func format(httpResponse: HttpResponse) -> String {
        return formatHeader(response: httpResponse) + httpResponse.getBody()
    }
    
    private func formatHeader(response: HttpResponse) -> String {
        let statusLine = statusLineToHeaderItem(response: response)
        let dateTime = dateTimeToHeaderItem(response: response)
        let contentType = contentTypeToHeaderItem(response: response)
        
        let formattedHeader = (statusLine + dateTime + contentType + ResponseFormatter.LINE_SEPARATOR)
        return formattedHeader
    }
    
    private func statusLineToHeaderItem(response: HttpResponse) -> String {
        return ResponseFormatter.HTTP_VERSION.rawValue + ResponseFormatter.SPACE +
            response.getStatusCode() + ResponseFormatter.SPACE +
            response.getStatusPhrase() + ResponseFormatter.LINE_SEPARATOR
    }
    
    private func dateTimeToHeaderItem(response: HttpResponse) -> String {
        return "Date: \(response.getResponseDateTime())" + ResponseFormatter.LINE_SEPARATOR
    }
    
    private func contentTypeToHeaderItem(response: HttpResponse) -> String {
        return "Content-Type: \(response.getContentType())" + ResponseFormatter.LINE_SEPARATOR
    }
}
