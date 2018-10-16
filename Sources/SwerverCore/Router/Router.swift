import Foundation

public class Router {
    private let responseHeaderFormatter = HttpResponseFormatter()
    private let routes = Routes()
    
    private let notFoundAction = NotFoundAction()

    public init() {}

    public func process(request: HttpRequest?) -> HttpResponse {

        if let request = request {
            let targetURL = request.getUrl()
            let targetMethod = request.getMethod()
            
            if let targetRoute = routes.fetchRoute(url: targetURL) {
                
                if targetMethod == RequestMethod.options {
                    return targetRoute.optionsAction().execute()
                }

                guard let action = targetRoute.getActions()[targetMethod] else {
                    return targetRoute.notAllowedAction().execute()
                }
                return action.execute()
            } else {
                return notFoundAction.execute()
            }
        } else {
            return notFoundAction.execute()
        }
    }
    
    public func addRoute(method: RequestMethod, url: String, handler: () -> (HttpAction)) {
        if let path = URL(string: url) {
            if routes.routeExist(url: path) {
                let existingRoute = routes.fetchRoute(url: path)
                existingRoute?.addAction(method: method, action: handler())
            } else {
                routes.addRoute(route: Route(url: path, actions: [method: handler()]))
            }
        }
    }
}
