import Foundation

public class Router {
    private let responseHeaderFormatter = ResponseFormatter()
    private let routes = Routes()
    
    private let notFoundAction = NotFoundAction()

    public init() {
        populateRoutes()
    }

    public func process(request: HttpRequest?) -> HttpResponse {

        if let request = request {
            let targetURL = request.getUrl()
            let targetMethod = request.getMethod()
            
            if let targetRoute = routes.fetchRoute(url: targetURL) {
                
                guard let action = targetRoute.actions[targetMethod] else {
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

    private func populateRoutes() {
        if let url = URL(string: Resource.test.rawValue),
            let url2 = URL(string: Resource.test2.rawValue) {
            
            let route1 = Route(url: url, actions: [RequestMethod.head: HeadAction(),
                                                   RequestMethod.get: GetAction(),
                                                   RequestMethod.options: OptionsAction(routes: routes, route: url)])
            
            let route2 = Route(url: url2, actions: [RequestMethod.head: HeadAction(),
                                                    RequestMethod.get: GetAction()])
            
            routes.addRoute(route: route1)
            routes.addRoute(route: route2)
        }
    }
}
