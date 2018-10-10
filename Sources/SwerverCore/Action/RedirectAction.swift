import Foundation

public class RedirectAction: HttpAction {
    
    private let responseBuilder = ResponseBuilder()
    private let redirectPath: URL
    
    public init(redirectPath: URL) {
        self.redirectPath = redirectPath
    }
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: .moved)
            .setHeader(header: .location, value: redirectPath.absoluteString)
            .build()
    }
}
