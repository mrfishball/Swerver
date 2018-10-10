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
        if let urlOne = URL(string: Resource.test_get.rawValue),
            let urlTwo = URL(string: Resource.test_head.rawValue),
            let urlThree = URL(string: Resource.test_option.rawValue),
            let urlFour = URL(string: Resource.test_option_two.rawValue) {
            
            let routeOne = Route(url: urlOne, actions: [RequestMethod.head: HeadAction(),
                                                   RequestMethod.get: GetAction()])
            
            let routeTwo = Route(url: urlTwo, actions: [RequestMethod.head: HeadAction()])
                
            let routeThree = Route(url: urlThree, actions: [RequestMethod.head: HeadAction(),
                                                            RequestMethod.get: GetAction(), RequestMethod.options: OptionsAction(routes: routes, route: urlThree)])
            
            let routeFour = Route(url: urlFour, actions: [RequestMethod.head: HeadAction(),
                                                            RequestMethod.get: GetAction(), RequestMethod.options: OptionsAction(routes: routes, route: urlFour)])
            
            routes.addRoute(route: routeOne)
            routes.addRoute(route: routeTwo)
            routes.addRoute(route: routeThree)
            routes.addRoute(route: routeFour)
        }
    }
}
