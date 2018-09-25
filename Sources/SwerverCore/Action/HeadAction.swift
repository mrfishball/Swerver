public class HeadAction {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
}

extension HeadAction: HttpAction {
    public func dispatch() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.ok.rawValue)
            .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
            .withContentType(contentType: ContentType.text.rawValue)
            .build()
    }
}
