public class HeadAction {

    private let responseBuilder = ResponseBuilder()

    public init() {}
}

extension HeadAction: HttpAction {
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.ok.rawValue)
            .withContentType(contentType: ContentType.text.rawValue)
            .build()
    }
}
