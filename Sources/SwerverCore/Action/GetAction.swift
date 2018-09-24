public class GetAction: Action {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
    
    public func dispatch() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.ok.rawValue)
            .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
            .withContentType(contentType: ContentType.text.rawValue)
            .withBody(body: String())
            .build()
    }
}
