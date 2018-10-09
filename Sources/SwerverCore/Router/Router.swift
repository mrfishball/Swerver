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

    public func process(request: HttpRequest?) -> HttpResponse {

        guard let targetURL = request?.getUrl(), let targetMethod = request?.getMethod() else {
            return notFoundAction.dispatch()
        }

        if routes.routeExist(url: targetURL) {

            let allowedActions = routes.fetchAllActions(url: targetURL)

            if isOptionsRequest(request: request) {
                return routes.optionsAction(url: targetURL).dispatch()
            }

            guard let action = allowedActions[targetMethod] else {
                return notFoundAction.dispatch()
            }
            return action.dispatch()
        }
        return notFoundAction.dispatch()
    }

    private func isOptionsRequest(request: HttpRequest?) -> Bool {
        return request?.getMethod() == RequestMethod.options
    }

    private func populateRoutes() {
        if let url = URL(string: Resource.test.rawValue) {
            routes.addRoute(url: url, actions: [RequestMethod.head: headAction, RequestMethod.get: getAction])
        }
    }
}
