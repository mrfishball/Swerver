import Foundation

public class RedirectAction: HttpAction {
    
    private let responseBuilder = HttpResponseBuilder()
    private let redirectPath: URL
    
    public init(redirectPath: URL) {
        self.redirectPath = redirectPath
    }
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .with(statusCode: .moved)
            .set(header: .location, value: redirectPath.absoluteString)
            .build()
    }
}
