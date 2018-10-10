import Foundation

public class Route {
    
    public let url: URL
    public var actions: [RequestMethod:HttpAction]
    
    public init(url: URL, actions: [RequestMethod:HttpAction]) {
        self.url = url
        self.actions = actions
    }
    
    public func getListOfMethods() -> [String] {
        var listOfMethods: [String] = []
        for (method, _) in actions {
            listOfMethods.append(method.rawValue)
        }
        return listOfMethods.sorted(by: <)
    }
    
    public func notAllowedAction() -> HttpAction {
        return NotAllowedAction(methods: getListOfMethods())
    }
}

extension Route: Equatable {
    
    public static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.url == rhs.url &&
            NSDictionary(dictionary: lhs.actions).isEqual(to: rhs.actions)
    }
}
