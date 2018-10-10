public enum StatusCode: String {
    case ok = "200"
    case not_allowed = "405"
    case not_found = "404"
    
    public func getStatusPhrase() -> String {
        switch self {
            case .ok: return "OK"
            case .not_allowed: return "Method Not Allowed"
            case .not_found: return "Not Found"
        }
    }
}
