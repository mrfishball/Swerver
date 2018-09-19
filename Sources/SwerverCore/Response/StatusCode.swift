public enum StatusCode: String {
    case ok = "200"
    case not_implemented = "501"
    
    public func getStatusPhrase() -> String {
        switch self {
            case .ok: return "OK"
            case .not_implemented: return "Not Implemented"
        }
    }
}
