import Foundation

public final class HttpResponse {
    
    public let httpVersion: String = HttpVersion.current.rawValue
    public let statusCode: String
    public let statusPhrase: String
    public let contentType: String
    public let dateTime: Date = Date()
    public let body: String
    public let contentLength : Int
    
    init(builder: ResponseBuilder) {
        self.statusCode = builder.statusCode
        self.statusPhrase = builder.statusPhrase
        self.contentType = builder.contentType
        self.body = builder.body
        self.contentLength = builder.contentLength
    }
}

extension HttpResponse: Equatable {
    public static func == (lhs: HttpResponse, rhs: HttpResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode &&
            lhs.statusPhrase == rhs.statusPhrase &&
            lhs.contentType == rhs.contentType &&
            lhs.body == rhs.body
    }
}
