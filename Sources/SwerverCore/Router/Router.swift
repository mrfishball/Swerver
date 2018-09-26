import Foundation

public class Router {
    private let responseHeaderFormatter = ResponseFormatter()
    private let routes = Routes()
    
    private let headAction = HeadAction()
    private let getAction = GetAction()
    private let notFoundAction = NotFoundAction()
    
    public init() {
        populateRoutes()
    }
    
    public func process(request: HttpRequest) -> String {
        let targetURL = request.getUrl()
        let targetMethod = request.getMethod()
        
        if routes.routeExist(url: targetURL) {
            let allowedActions = routes.fetchAllActions(url: targetURL)
            if isOptionsRequest(request: request) {
                return responseHeaderFormatter.format(httpResponse: routes.optionsAction(url: targetURL).dispatch())
            }
            guard let action = allowedActions[targetMethod] else {
                return "HTTP/1.1"
            }
            return responseHeaderFormatter.format(httpResponse: action.dispatch())
        }
        return responseHeaderFormatter.format(httpResponse: notFoundAction.dispatch())
    }
    
    private func isOptionsRequest(request: HttpRequest) -> Bool {
        return request.getMethod() == RequestMethod.options
    }
    
    private func populateRoutes() {
        routes.addRoute(url: URL(string: Resource.home.rawValue)!, actions: [RequestMethod.head: headAction, RequestMethod.get: getAction])
        routes.addRoute(url: URL(string: Resource.test.rawValue)!, actions: [RequestMethod.get: getAction])
    }
}
