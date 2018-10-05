import Foundation

public final class HttpResponse {

    public let statusCode: String
    public let contentType: String
    public let dateTime: Date = Date()
    public let body: String
    public let contentLength : Int
    public let allowedMethods: [String]

    init(builder: ResponseBuilder) {
        self.statusCode = builder.statusCode?.rawValue ?? String()
        self.contentType = builder.contentType?.rawValue ?? String()
        self.body = builder.body
        self.contentLength = builder.contentLength
        self.allowedMethods = builder.allowedMethods
    }
}

extension HttpResponse: Equatable {
    public static func == (lhs: HttpResponse, rhs: HttpResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode &&
            lhs.contentType == rhs.contentType &&
            lhs.body == rhs.body &&
            lhs.allowedMethods == rhs.allowedMethods
    }
}
