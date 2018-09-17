import Foundation

public class ResponseBuilder {
    
    public init() {}
    
    public func generate200OKResponse() -> HttpResponse {
        let response = HttpResponse(statusCode: RequestStatus.SUCCESS.getStatusCode(), statusPhrase: RequestStatus.SUCCESS.getStatusPhrase())
        return response
    }
    
    public func generate501NotImplementedResponse() -> HttpResponse {
        let response = HttpResponse(statusCode: RequestStatus.FAILED.getStatusCode(), statusPhrase: RequestStatus.FAILED.getStatusPhrase())
        return response
    }
}
