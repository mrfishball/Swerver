public enum StatusCode: String {
    case ok = "200"
    case moved = "301"
    case notAllowed = "405"
    case notFound = "404"
    
    public func getStatusPhrase() -> String {
        switch self {
            case .ok: return "OK"
            case .moved: return "Moved Permanently"
            case .notAllowed: return "Method Not Allowed"
            case .notFound: return "Not Found"
        }
    }
}
