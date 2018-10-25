import Foundation

public final class HttpResponse {

    public let statusCode: StatusCode?
    public let body: String
    public let headers: [ResponseHeader:String]
    public let dateTime: Date

    init(builder: HttpResponseBuilder) {
        statusCode = builder.statusCode
        body = builder.body
        headers = builder.headers
        dateTime = Date()
    }
    
    public func get(header: ResponseHeader) -> String? {
        return headers[header]
    }
}

extension HttpResponse: Equatable {
    
    public static func == (lhs: HttpResponse, rhs: HttpResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode &&
            NSDictionary(dictionary: lhs.headers).isEqual(to: rhs.headers) &&
            lhs.body == rhs.body
    }
}
