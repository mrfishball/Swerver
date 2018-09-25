import Foundation

public class Router {
    private let responseBuilder = ResponseBuilder()
    private let responseHeaderFormatter = ResponseFormatter()
    
    public init() {}
    
    public func process(request: HttpRequest) -> String {
        if request.getMethod() == RequestMethods.get {
            let response = responseBuilder
                            .withStatusCode(statusCode: StatusCode.ok.rawValue)
                            .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                            .withContentType(contentType: ContentType.text.rawValue)
                            .build()
            return responseHeaderFormatter.format(httpResponse: response)
        }
        let response = responseBuilder
                        .withStatusCode(statusCode: StatusCode.not_implemented.rawValue)
                        .withStatusPhrase(statusPhrase: StatusCode.not_implemented.getStatusPhrase())
                        .withContentType(contentType: ContentType.text.rawValue)
                        .build()
        return responseHeaderFormatter.format(httpResponse: response)
    }
}
