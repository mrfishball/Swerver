public class NotFoundAction: Action {
    
    private let responseBuilder: ResponseBuilder
    
    public init(builder: ResponseBuilder) {
        responseBuilder = builder
    }
    
    public func dispatch() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.not_found.rawValue)
            .withStatusPhrase(statusPhrase: StatusCode.not_found.getStatusPhrase())
            .withContentType(contentType: ContentType.text.rawValue)
            .withBody(body: String())
            .build()
    }
}
