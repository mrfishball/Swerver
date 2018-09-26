public class GetAction {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
}

extension GetAction: HttpAction {
    public func dispatch() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.ok.rawValue)
            .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
            .withContentType(contentType: ContentType.text.rawValue)
            .build()
    }
}
