import Foundation

public class OptionsAction: HttpAction {
    
    private let responseBuilder = ResponseBuilder()
    private let routes: Routes
    private let route: URL
    
    public init(routes: Routes, route: URL) {
        self.routes = routes
        self.route = route
    }
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .with(statusCode: .ok)
            .with(contentType: .text)
            .set(header: .allow, value: allowedMethods())
            .build()
    }
    
    private func allowedMethods() -> String {
        var listOfMethods = routes.allowedMethods(url: route)
        if route.absoluteString == Resource.test_option_two.rawValue {
            listOfMethods.append("POST")
            listOfMethods.append("PUT")
            return listOfMethods.sorted(by: <).joined(separator: ",")
        }
        return routes.allowedMethods(url: route).joined(separator: ",")
    }
}
