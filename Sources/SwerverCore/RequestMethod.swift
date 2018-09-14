public enum RequestMethods {
    case GET, OTHER
    
    public func getHeader() -> String {
        switch self {
        case .GET: return "200 OK"
        case .OTHER: return "501 Not Implemented"
        }
    }
    
    public func getBody() -> String {
        switch self {
        case .GET: return "<h1>Welcome to the dummy server!</h1>"
        case .OTHER: return "<h1>Not Implemented</h1>" + "<p>This method is not implemented.<br /></p>"
        }
    }
}
