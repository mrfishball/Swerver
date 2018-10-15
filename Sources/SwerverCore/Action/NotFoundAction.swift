public class NotFoundAction: HttpAction {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .with(statusCode: .not_found)
            .with(contentType: .text)
            .build()
    }
}
