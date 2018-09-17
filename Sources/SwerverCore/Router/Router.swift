import Foundation

public class Router {
    
    private let responseBuilder = ResponseBuilder()
    
    public init() {}
    
    public func process (request: HttpRequest) -> HttpResponse {
        if request.getMethod() == RequestMethods.GET.rawValue {
            return responseBuilder.generate200OKResponse()
        }
        return responseBuilder.generate501NotImplementedResponse()
    }
}
