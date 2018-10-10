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
            .withStatusCode(statusCode: .ok)
            .withContentType(contentType: .text)
            .setHeader(header: .allow, value: allowedMethods())
            .build()
    }
    
    private func allowedMethods() -> String {
        return routes.allowedMethods(url: route).sorted(by: <).joined(separator: ", ")
    }
}
