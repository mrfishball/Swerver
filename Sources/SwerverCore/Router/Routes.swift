import Foundation

public class Routes {

    private var allRoutes: [URL:Route] = [:]

    public init() {}

    public func addRoute(route: Route) {
        allRoutes[route.url] = route
    }

    public func routeExist(url: URL) -> Bool {
        return allRoutes[url] != nil
    }

    public func fetchRoute(url: URL) -> Route? {
        return allRoutes[url]
    }
    
    public func allowedMethods(url: URL) -> [String] {
        return allRoutes[url]?.getListOfMethods() ?? []
    }
}
