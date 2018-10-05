public class OptionsAction: HttpAction {
    
    private let responseBuilder = ResponseBuilder()
    private var allowedMethods: [String] = []
    
    public init() {}
    
    public func setAllowedMethods(methods: [String]) {
        allowedMethods = methods
    }
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: .ok)
            .withContentType(contentType: .text)
            .withAllowedMethods(allowedMethods: allowedMethods)
            .build()
    }
}
