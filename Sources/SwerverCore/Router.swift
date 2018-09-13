import Foundation

public class Router {
    
    public init() {}
    
    public func process (request: HttpRequest) -> HttpResponse {
        if request.toString().hasPrefix("GET") {
            let responseHeader = RequestMethods.GET.getHeader()
            let responseMessage = RequestMethods.GET.getBody()
            return HttpResponse(header: responseHeader, payload: responseMessage)
        }
        return HttpResponse(header: RequestMethods.OTHER.getHeader(), payload: RequestMethods.OTHER.getBody())
    }
}
