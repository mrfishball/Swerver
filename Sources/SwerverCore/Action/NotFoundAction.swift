public class NotFoundAction {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
}

extension NotFoundAction: HttpAction {
    public func dispatch() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.not_found.rawValue)
            .withStatusPhrase(statusPhrase: StatusCode.not_found.getStatusPhrase())
            .withContentType(contentType: ContentType.text.rawValue)
            .withBody(body: String())
            .build()
    }
}
