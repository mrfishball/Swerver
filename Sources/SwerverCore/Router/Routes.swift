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

    public func fetchRoute(url: URL) -> [RequestMethod:HttpAction] {
        return allRoutes[url]!
    }
}
