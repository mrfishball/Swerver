public class ResponseConstructor {
    
    public init() {}
    
    public func generate200OKResponse() -> HttpResponse {
        let response = HttpResponse(statusCode: RequestStatus.success.getStatusCode(), statusPhrase: RequestStatus.success.getStatusPhrase())
        return response
    }
    
    public func generate501NotImplementedResponse() -> HttpResponse {
        let response = HttpResponse(statusCode: RequestStatus.failed.getStatusCode(), statusPhrase: RequestStatus.failed.getStatusPhrase())
        return response
    }
}
