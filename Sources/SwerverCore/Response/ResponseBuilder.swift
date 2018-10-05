import Foundation

public class ResponseBuilder {
    private(set) var statusCode: StatusCode?
    private(set) var statusPhrase: String = String()
    private(set) var contentType: ContentType?
    private(set) var body: String = String()
    private(set) var contentLength: Int = 0
    private(set) var allowedMethods: [String] = []

    public init() {}

    public func withStatusCode(statusCode: StatusCode) -> ResponseBuilder {
        self.statusCode = statusCode
        return self
    }

    public func withContentType(contentType: ContentType) -> ResponseBuilder {
        self.contentType = contentType
        return self
    }

    public func withBody(body: String) -> ResponseBuilder {
        self.body = body
        return self
    }

    public func withContentLength(contentLength: Int) -> ResponseBuilder {
        self.contentLength = contentLength
        return self
    }

    public func withAllowedMethods(allowedMethods: [String]) -> ResponseBuilder {
        self.allowedMethods = allowedMethods.sorted(by: <)
        return self
    }

    public func build() -> HttpResponse {
        if let statusPhrase = statusCode?.getStatusPhrase() {
            self.statusPhrase = statusPhrase
        }
        return HttpResponse(builder: self)
    }
}
