import Foundation

public class Router {
    
    let httpResponseBuilder = HttpResponseBuilder()
    
    public init() {}
    
    public func process (request: HttpRequest) -> String {
        if request.toString().hasPrefix("GET") {
            let responseHeader = RequestMethods.GET.getHeader()
            let responseMessage = RequestMethods.GET.getBody()
            return httpResponseBuilder.build(header: responseHeader, payload: responseMessage)
        }
        return httpResponseBuilder.build(header: RequestMethods.OTHER.getHeader(), payload: RequestMethods.OTHER.getBody())
    }
}
