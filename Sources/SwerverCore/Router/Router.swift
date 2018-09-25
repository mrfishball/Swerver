import Foundation

public class Router {
    private let responseHeaderFormatter = ResponseFormatter()
    
    private let headAction = HeadAction()
    private let getAction = GetAction()
    private let notFoundAction = NotFoundAction()
    private var optionsAction = OptionsAction()
    
    private var routes: [URL:[RequestMethod:HttpAction]] = [:]
    
    public init() {
        populateRoutes()
    }
    
    public func process(request: HttpRequest) -> String {
        
        if routeExist(request: request) {
            let allowedMethods = fetchAllowedMethod(request: request)
            if isOptionsRequest(request: request) {
                optionsAction.setAllowedMethods(methods: allowedMethodsToList(methods: allowedMethods))
                return responseHeaderFormatter.format(httpResponse: optionsAction.dispatch())
            }
            guard let action = allowedMethods[request.getMethod()] else {
                return "HTTP/1.1"
            }
            return responseHeaderFormatter.format(httpResponse: action.dispatch())
        }
        return responseHeaderFormatter.format(httpResponse: notFoundAction.dispatch())
    }
    
    private func fetchAllowedMethod(request: HttpRequest) -> [RequestMethod:HttpAction] {
        return routes[request.getUrl()]!
    }
    
    private func isOptionsRequest(request: HttpRequest) -> Bool {
        return request.getMethod() == RequestMethod.options
    }
    
    private func routeExist(request: HttpRequest) -> Bool {
        return routes[request.getUrl()] != nil
    }
    
    private func allowedMethodsToList(methods: [RequestMethod:HttpAction]) -> [String] {
        var allowedMethods = [String]()
        for (method, _) in methods {
            allowedMethods.append(method.rawValue)
        }
        return allowedMethods
    }
    
    private func populateRoutes() {
        routes[URL(string: "/demo")!] = [RequestMethod.head: headAction, RequestMethod.get: getAction]
        routes[URL(string: "/demo2")!] = [RequestMethod.head: headAction]
        routes[URL(string: "/simple_get")!] = [RequestMethod.get: getAction]
    }
}
