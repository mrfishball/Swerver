import Foundation

public class Routes {

    private var allRoutes: [URL:[RequestMethod:HttpAction]] = [:]
    
    public init() {}
    
    public func addRoute(url: URL, actions: [RequestMethod:HttpAction]) {
        allRoutes[url] = actions
    }
    
    public func routeExist(url: URL) -> Bool {
        return allRoutes[url] != nil
    }
    
    public func fetchAllActions(url: URL) -> [RequestMethod:HttpAction] {
        return allRoutes[url]!
    }

    public func fetchAllowedMethods(url: URL) -> [String] {
        var allowedMethods = [String]()
        for (method, _) in fetchAllActions(url: url) {
            allowedMethods.append(method.rawValue)
        }
        return allowedMethods
    }
}
