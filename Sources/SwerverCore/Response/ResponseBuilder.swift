import Foundation

public class ResponseBuilder {
    private(set) var statusCode: StatusCode?
    private(set) var body: String = String()
    private(set) var headers: [ResponseHeader:String] = [:]

    public init() {
}

    public func withStatusCode(statusCode: StatusCode) -> ResponseBuilder {
        self.statusCode = statusCode
        return self
    }
    
    public func withBody(body: String) -> ResponseBuilder {
        self.body = body
        return setHeader(header: .contentLength, value: String(body.count))
    }

    public func withContentType(contentType: ContentType) -> ResponseBuilder {
        headers[.contentType] = contentType.rawValue
        return self
    }
    
    public func setHeader(header: ResponseHeader, value: String) -> ResponseBuilder {
        headers[header] = value
        return self
    }

    public func build() -> HttpResponse {
        return HttpResponse(builder: self)
    }
}
