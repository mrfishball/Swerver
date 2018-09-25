public class OptionsAction {
    
    private let responseBuilder = ResponseBuilder()
    private var allowedMethods: [String] = []
    
    public init() {}
    
    public func setAllowedMethods(methods: [String]) {
        allowedMethods = methods
    }
}

extension OptionsAction: HttpAction {
    public func dispatch() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: StatusCode.ok.rawValue)
            .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
            .withContentType(contentType: ContentType.text.rawValue)
            .withAllowedMethods(allowedMethods: allowedMethods)
            .build()
    }
}
