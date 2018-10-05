public class NotFoundAction: HttpAction {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.not_found.rawValue)
            .withContentType(contentType: ContentType.text.rawValue)
            .build()
    }
}
