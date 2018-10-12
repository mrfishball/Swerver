import Foundation

public class OptionsAction: HttpAction {
    
    private let responseBuilder = ResponseBuilder()
    private let listOfAllowedMethods: [String]
    
    public init(methods: [String]) {
        listOfAllowedMethods = methods
    }
    
    public func execute() -> HttpResponse {
        return responseBuilder
            .with(statusCode: .ok)
            .with(contentType: .text)
            .set(header: .allow, value: allowedMethods())
            .build()
    }
    
    private func allowedMethods() -> String {
        return listOfAllowedMethods.joined(separator: ",")
    }
}
