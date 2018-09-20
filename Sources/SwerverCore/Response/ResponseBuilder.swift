import Foundation

public class ResponseBuilder {
    
    private var statusCode: String = String()
    private var statusPhrase: String = String()
    private var contentType: String = String()
    private var body: String = String()
    private var dateTime: String = String()
    
    public init() {}
    
    private func setDateTime() -> String {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateTimeFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss 'GMT'"
        let currentDateTime: String = dateTimeFormatter.string(from: Date())
        return currentDateTime
    }
    
    public func setStatusCode(statusCode: String) -> ResponseBuilder {
        self.statusCode = statusCode
        return self
    }
    
    public func setStatusPhrase(statusPhrase: String) -> ResponseBuilder {
        self .statusPhrase = statusPhrase
        return self
    }
    
    public func setContentType(contentType: String) -> ResponseBuilder {
        self.contentType = contentType
        return self
    }
    
    public func setBody(body: String) -> ResponseBuilder {
        self.body = body
        return self
    }
    
    public func build() -> HttpResponse {
        return HttpResponse.anEmptyResponse()
            .setResponseStatusCode(statusCode: self.statusCode)
            .setResponseStatusPhrase(statusPhrase: self.statusPhrase)
            .setResponseContentType(contentType: self.contentType)
            .setResponseBody(body: self.body)
            .setResponseDateTime(dateTime: self.setDateTime())
    }
}
