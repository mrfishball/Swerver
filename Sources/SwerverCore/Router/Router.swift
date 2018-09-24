import Foundation

public class Router {
    private let responseBuilder = ResponseBuilder()
    private let responseHeaderFormatter = ResponseFormatter()
    
    private let headAction: Action
    private let getAction: Action
    private let notFoundAction: Action
    
    private var routes: [URL:[RequestMethod:Action]] = [:]
    
    public init() {
        headAction = HeadAction(builder: responseBuilder)
        getAction = GetAction(builder: responseBuilder)
        notFoundAction = NotFoundAction(builder: responseBuilder)
        populateRoutes()
    }
    
    public func process(request: HttpRequest) -> String {
        if routeExist(request: request) {
            let route = fetchMethod(request: request)
            guard let action = route[request.getMethod()] else {
                return "HTTP/1.1"
            }
            return responseHeaderFormatter.format(httpResponse: action.dispatch())
        }
        return responseHeaderFormatter.format(httpResponse: notFoundAction.dispatch())
    }
    
    private func fetchMethod(request: HttpRequest) -> [RequestMethod:Action] {
        return routes[request.getUrl()]!
    }
    
    private func routeExist(request: HttpRequest) -> Bool {
        return routes[request.getUrl()] != nil
    }
    
    private func populateRoutes() {
        routes[URL(string: "/demo")!] = [RequestMethod.head: headAction, RequestMethod.get: getAction]
        routes[URL(string: "/simple_get")!] = [RequestMethod.get: getAction]
    }
}
