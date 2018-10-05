public class NotFoundAction {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
}

extension NotFoundAction: HttpAction {
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.not_found.rawValue)
            .withContentType(contentType: ContentType.text.rawValue)
            .build()
    }
}
