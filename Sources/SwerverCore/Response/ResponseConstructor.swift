public class ResponseConstructor {
    
    public init() {}
    
    public func generate200OKResponse() -> HttpResponse {
        let body = "\(StatusCode.ok.rawValue) \(StatusCode.ok.getStatusPhrase())"
        let response = HttpResponse(statusCode: StatusCode.ok.rawValue, statusPhrase: StatusCode.ok.getStatusPhrase(), body: body)
        return response
    }
    
    public func generate501NotImplementedResponse() -> HttpResponse {
        let body = "\(StatusCode.not_implemented.rawValue) \(StatusCode.not_implemented.getStatusPhrase())"
        let response = HttpResponse(statusCode: StatusCode.not_implemented.rawValue, statusPhrase: StatusCode.not_implemented.getStatusPhrase(), body: body)
        return response
    }
}
