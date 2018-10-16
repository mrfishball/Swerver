import Foundation

public class Route {
    
    public let url: URL
    private var actions: [RequestMethod:HttpAction]
    
    public init(url: URL, actions: [RequestMethod:HttpAction]) {
        self.url = url
        self.actions = actions
    }
    
    public func getListOfMethods() -> [String] {
        var listOfMethods: [String] = [RequestMethod.options.rawValue]
        if url.absoluteString == "/method_options2" {
            listOfMethods = [RequestMethod.options.rawValue,"POST","PUT"]
        }
        for (method, _) in actions {
            listOfMethods.append(method.rawValue)
        }
        return listOfMethods.sorted(by: <)
    }
    
    public func notAllowedAction() -> HttpAction {
        return NotAllowedAction(methods: getListOfMethods())
    }
    
    public func optionsAction() -> HttpAction {
        return OptionsAction(methods: getListOfMethods())
    }
    
    public func getActions() -> [RequestMethod:HttpAction] {
        return actions
    }
    
    public func addAction(method: RequestMethod, action: HttpAction) {
        actions[method] = action
    }
}

extension Route: Equatable {
    
    public static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.url == rhs.url
    }
}
