import Foundation

public class Routes {

    private var allRoutes: [URL:[RequestMethod:HttpAction]] = [:]
    
    public init() {}
    
    public func addRoute(url: URL?, actions: [RequestMethod:HttpAction]) {
        if let url = url {
            allRoutes[url] = actions
        }
        logger.error("Error adding route: Invalid string for URL type")
    }
    
    public func numberOfRoute() -> Int {
        return allRoutes.count
    }
    
    public func routeExist(url: URL?) -> Bool {
        if let url = url {
            return allRoutes[url] != nil
        }
        return false
    }
    
    public func fetchAllActions(url: URL?) -> [RequestMethod:HttpAction] {
        if let url = url {
            if let allActions = allRoutes[url] {
                return allActions
            }
            return [:]
        }
        return [:]
    }

    public func fetchAllowedMethods(url: URL?) -> [String] {
        var allowedMethods = [String]()
        for (method, _) in fetchAllActions(url: url) {
            allowedMethods.append(method.rawValue)
        }
        return allowedMethods.sorted(by: <)
    }
}
