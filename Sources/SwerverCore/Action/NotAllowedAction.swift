public class NotAllowedAction {
    
    private let responseBuilder = ResponseBuilder()
    private var allowedMethods: [String] = []
    
    public init() {}
    
    public func setAllowedMethods(methods: [String]) {
        allowedMethods = methods
    }
}

extension NotAllowedAction: HttpAction {
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.not_allowed.rawValue)
            .withStatusPhrase(statusPhrase: StatusCode.not_allowed.getStatusPhrase())
            .withContentType(contentType: ContentType.text.rawValue)
            .withAllowedMethods(allowedMethods: allowedMethods)
            .build()
    }
}
