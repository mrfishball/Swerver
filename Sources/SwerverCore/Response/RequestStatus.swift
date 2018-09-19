public enum RequestStatus {
    case success, failed
    
    public func getStatusPhrase() -> String {
        switch self {
            case .success: return "OK"
            case .failed: return "Not Implemented"
        }
    }
    
    public func getStatusCode() -> String {
        switch self {
            case .success: return "200"
            case .failed: return "501"
        }
    }
}
