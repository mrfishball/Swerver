import Foundation

public class NotAllowedAction: HttpAction {
    
    private let responseBuilder = HttpResponseBuilder()
    private let listOfAllowedMethods: [String]
    
    public init(methods: [String]) {
        listOfAllowedMethods = methods
    }
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .with(statusCode: .notAllowed)
            .with(contentType: .text)
            .set(header: .allow, value: getAllowedMethods())
            .build()
    }
    
    private func getAllowedMethods() -> String {
        return listOfAllowedMethods.joined(separator: ",")
    }
}
