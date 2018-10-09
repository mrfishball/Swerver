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
            
            if routes.routeExist(url: targetURL) {
                
                let targetRoute = routes.fetchRoute(url: targetURL)
                
                guard let action = targetRoute[targetMethod] else {
                    return notFoundAction.execute()
                }
                return action.execute()
            }
        }
        return notFoundAction.execute()
    }

    private func populateRoutes() {
        let route = URL(string: Resource.test.rawValue)
        let route2 = URL(string: Resource.test2.rawValue)

        routes.addRoute(url: route!, actions: [RequestMethod.head: HeadAction(), RequestMethod.get: GetAction(), RequestMethod.options: OptionsAction(routes: routes, route: route!)])
        routes.addRoute(url: route2!, actions: [RequestMethod.head: HeadAction(), RequestMethod.get: GetAction()])
    }
}
