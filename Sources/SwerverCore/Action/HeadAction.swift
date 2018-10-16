public class HeadAction: HttpAction {

    private let responseBuilder = HttpResponseBuilder()
    
    public init() {}
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .with(statusCode: .ok)
            .with(contentType: .text)
            .build()
    }
}
