import Foundation

public class Routes {
    
    private let optionsActionHandler = OptionsAction()

    private var allRoutes: [URL:[RequestMethod:HttpAction]] = [:]
    
    public init() {}
    
    public func addRoute(url: URL, actions: [RequestMethod:HttpAction]) {
        allRoutes[url] = actions
    }
    
    public func routeExist(url: URL) -> Bool {
        return allRoutes[url] != nil
    }
    
    public func optionsAction(url: URL) -> HttpAction {
        optionsActionHandler.setAllowedMethods(methods: fetchAllowedMethods(url: url))
        return optionsActionHandler
    }
    
    public func fetchAllActions(url: URL) -> [RequestMethod:HttpAction] {
        return allRoutes[url]!
    }

    private func fetchAllowedMethods(url: URL) -> [String] {
        var allowedMethods = [String]()
        for (method, _) in fetchAllActions(url: url) {
            allowedMethods.append(method.rawValue)
        }
        return allowedMethods
    }
}
