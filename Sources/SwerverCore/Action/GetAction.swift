public class GetAction: HttpAction {

    private let responseBuilder = ResponseBuilder()

    public init() {}
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.ok.rawValue)
            .withContentType(contentType: ContentType.text.rawValue)
            .build()
    }
}
