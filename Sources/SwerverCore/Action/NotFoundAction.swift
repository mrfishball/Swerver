public class NotFoundAction {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
}

extension NotFoundAction: HttpAction {
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.notFound.rawValue)
            .withStatusPhrase(statusPhrase: StatusCode.notFound.getStatusPhrase())
            .withContentType(contentType: ContentType.text.rawValue)
            .build()
    }
}
