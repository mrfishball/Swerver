import Foundation

public class HttpResponseBuilder {
    private(set) var statusCode: StatusCode?
    private(set) var body: String = String()
    private(set) var headers: [ResponseHeader:String] = [:]

    public init() {
        headers[.contentLength] = String(0)
    }

    public func with(statusCode: StatusCode) -> HttpResponseBuilder {
        self.statusCode = statusCode
        return self
    }
    
    public func with(body: String) -> HttpResponseBuilder {
        self.body = body
        return set(header: .contentLength, value: String(body.count))
    }

    public func with(contentType: ContentType) -> HttpResponseBuilder {
        headers[.contentType] = contentType.rawValue
        return self
    }
    
    public func set(header: ResponseHeader, value: String) -> HttpResponseBuilder {
        headers[header] = value
        return self
    }

    public func build() -> HttpResponse {
        return HttpResponse(builder: self)
    }
}
