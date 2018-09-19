public class Router {
    
    private let responseBuilder = ResponseConstructor()
    
    public init() {}
    
    public func process(request: HttpRequest) -> HttpResponse {
        if request.getMethod() == RequestMethods.GET {
            return responseBuilder.generate200OKResponse()
        }
        return responseBuilder.generate501NotImplementedResponse()
    }
}
