public class HeadAction: HttpAction {

    private let responseBuilder = ResponseBuilder()
    
    public init() {}
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: .ok)
            .withContentType(contentType: .text)
            .build()
    }
}
