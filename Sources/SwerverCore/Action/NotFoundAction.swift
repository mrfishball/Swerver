public class NotFoundAction: HttpAction {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: .not_found)
            .withContentType(contentType: .text)
            .build()
    }
}
