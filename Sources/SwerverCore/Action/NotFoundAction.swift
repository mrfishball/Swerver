public class NotFoundAction: HttpAction {
    
    private let responseBuilder = HttpResponseBuilder()
    
    public init() {}
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .with(statusCode: .notFound)
            .with(contentType: .text)
            .build()
    }
}
