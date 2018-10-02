public enum StatusCode: String {
    case ok = "200"
    case notFound = "404"
    case notAllowed = "405"
    
    public func getStatusPhrase() -> String {
        switch self {
            case .ok: return "OK"
            case .notFound: return "Not Found"
            case .notAllowed: return "Method Not Allowed"
        }
    }
}
