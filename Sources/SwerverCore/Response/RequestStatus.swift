public enum RequestStatus {
    case SUCCESS, FAILED
    
    public func getStatusPhrase() -> String {
        switch self {
            case .SUCCESS: return "OK"
            case .FAILED: return "Not Implemented"
        }
    }
    
    public func getStatusCode() -> String {
        switch self {
            case .SUCCESS: return "200"
            case .FAILED: return "501"
        }
    }
}
