import Quick
import Nimble
import Swerver
import Foundation

class RouterSpec: QuickSpec {
    override func spec() {
        describe("A Router") {
            var router: Router!
            var formatter: ResponseFormatter!
            var responseBuilder: ResponseBuilder!
            
            beforeEach {
                router = Router()
                formatter = ResponseFormatter()
                responseBuilder = ResponseBuilder()
            }
            
            context("when receive a GET request") {
                it("returns an response object with 200 OK status") {
                    let aGetRequest = HttpRequest(method: RequestMethods.get, url: URL(string: "/")!, httpVersion: HttpVersion.current)
                    let expectedResponse = responseBuilder
                                            .setStatusCode(statusCode: StatusCode.ok.rawValue)
                                            .setStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                            .setContentType(contentType: ContentType.text.rawValue)
                                            .setBody(body: "200 OK")
                                            .build()
                    expect(router.process(request: aGetRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }

            context("when receive a request of type other than GET") {
                it("returns an response object with 501 Not Implemented status") {
                    let aGetRequest = HttpRequest(method: RequestMethods.other, url: URL(string: "/")!, httpVersion: HttpVersion.current)
                    let expectedResponse = responseBuilder
                        .setStatusCode(statusCode: StatusCode.not_implemented.rawValue)
                        .setStatusPhrase(statusPhrase: StatusCode.not_implemented.getStatusPhrase())
                        .setContentType(contentType: ContentType.text.rawValue)
                        .setBody(body: "501 Not Implemented")
                        .build()
                    expect(router.process(request: aGetRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }
        }
    }
}
