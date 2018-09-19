import Foundation

public class Router {
    
    private let responseBuilder = ResponseConstructor()
    private let responseHeaderFormatter = ResponseFormatter()
    
    public init() {}
    
    public func process(request: HttpRequest) -> String {
        if request.getMethod() == RequestMethods.get {
            return responseHeaderFormatter.format(httpResponse: responseBuilder.generate200OKResponse())
        }
        return responseHeaderFormatter.format(httpResponse: responseBuilder.generate501NotImplementedResponse())
    }
}
