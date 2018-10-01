import Foundation

public class Router {
    private let responseHeaderFormatter = ResponseFormatter()
    private let routes = Routes()

    private let headAction = HeadAction()
    private let getAction = GetAction()
    private let notFoundAction = NotFoundAction()
    private let optionsActionHandler = OptionsAction()
    private let notAllowedActionHandler = NotAllowedAction()

    public init() {
        populateRoutes()
    }

    public func process(request: HttpRequest) -> String {

        let targetURL = request.getUrl()
        let targetMethod = request.getMethod()

        if routes.routeExist(url: targetURL) {

            let allowedActions = routes.fetchAllActions(url: targetURL)

            if isOptionsRequest(request: request) {
                return responseHeaderFormatter.format(httpResponse: optionsAction(url: targetURL).execute())
            }

            guard let action = allowedActions[targetMethod] else {
                return responseHeaderFormatter.format(httpResponse: notAllowedAction(url: targetURL).execute())
            }
            return responseHeaderFormatter.format(httpResponse: action.execute())
        }
        return responseHeaderFormatter.format(httpResponse: notFoundAction.execute())
    }
    
    private func optionsAction(url: URL) -> HttpAction {
        optionsActionHandler.setAllowedMethods(methods: routes.fetchAllowedMethods(url: url))
        return optionsActionHandler
    }
    
    private func notAllowedAction(url: URL) -> HttpAction {
        notAllowedActionHandler.setAllowedMethods(methods: routes.fetchAllowedMethods(url: url))
        return notAllowedActionHandler
    }

    private func isOptionsRequest(request: HttpRequest) -> Bool {
        return request.getMethod() == RequestMethod.options
    }

    private func populateRoutes() {
        routes.addRoute(url: URL(string: Resource.test.rawValue), actions: [RequestMethod.head: headAction, RequestMethod.get: getAction])
        routes.addRoute(url: URL(string: Resource.tests2.rawValue), actions: [RequestMethod.head: headAction])
    }
}
