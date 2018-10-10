import Foundation

public class NotAllowedAction: HttpAction {
    
    private let responseBuilder = ResponseBuilder()
    private let listOfAllowedMethods: [String]
    
    public init(methods: [String]) {
        listOfAllowedMethods = methods
    }
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .withStatusCode(statusCode: .not_allowed)
            .withContentType(contentType: .text)
            .setHeader(header: .allow, value: getAllowedMethods())
            .build()
    }
    
    private func getAllowedMethods() -> String {
        return listOfAllowedMethods.joined(separator: ",")
    }
}
