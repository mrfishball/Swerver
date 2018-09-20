import Foundation

public class Router {
    
    private let responseBuilder = ResponseBuilder()
    private let responseHeaderFormatter = ResponseFormatter()
    
    public init() {}
    
    public func process(request: HttpRequest) -> String {
        if request.getMethod() == RequestMethods.get {
            let response = responseBuilder
                            .setStatusCode(statusCode: StatusCode.ok.rawValue)
                            .setStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                            .setContentType(contentType: ContentType.text.rawValue)
                            .setBody(body: "200 OK")
                            .build()
            return responseHeaderFormatter.format(httpResponse: response)
        }
        let response = responseBuilder
            .setStatusCode(statusCode: StatusCode.not_implemented.rawValue)
            .setStatusPhrase(statusPhrase: StatusCode.not_implemented.getStatusPhrase())
            .setContentType(contentType: ContentType.text.rawValue)
            .setBody(body: "501 Not Implemented")
            .build()
        return responseHeaderFormatter.format(httpResponse: response)
    }
}
