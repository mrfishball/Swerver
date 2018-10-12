import Foundation

public class ResponseBuilder {
    private(set) var statusCode: StatusCode?
    private(set) var body: String = String()
    private(set) var headers: [ResponseHeader:String] = [:]

    public init() {
        headers[.contentLength] = String(0)
    }

    public func with(statusCode: StatusCode) -> ResponseBuilder {
        self.statusCode = statusCode
        return self
    }
    
    public func with(body: String) -> ResponseBuilder {
        self.body = body
        return set(header: .contentLength, value: String(body.count))
    }

    public func with(contentType: ContentType) -> ResponseBuilder {
        headers[.contentType] = contentType.rawValue
        return self
    }
    
    public func set(header: ResponseHeader, value: String) -> ResponseBuilder {
        headers[header] = value
        return self
    }

    public func build() -> HttpResponse {
        return HttpResponse(builder: self)
    }
}
