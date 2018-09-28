public enum StatusCode: String {
    case ok = "200"
    case not_found = "404"
    case not_allowed = "405"
    
    public func getStatusPhrase() -> String {
        switch self {
            case .ok: return "OK"
            case .not_found: return "Not Found"
            case .not_allowed: return "Method Not Allowed"
        }
    }
}
