public class GetAction {

    private let responseBuilder = ResponseBuilder()

    public init() {}
}

extension GetAction: HttpAction {
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.ok.rawValue)
            .withContentType(contentType: ContentType.text.rawValue)
            .build()
    }
}
