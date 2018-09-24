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
            
            context("when receive a GET request for an existing route") {
                it("returns an response with 200 OK status") {
                    let aGetRequest = HttpRequest(method: RequestMethod.get, url: URL(string: "/demo")!, httpVersion: HttpVersion.current)
                    let expectedResponse = responseBuilder
                                            .withStatusCode(statusCode: StatusCode.ok.rawValue)
                                            .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                            .withContentType(contentType: ContentType.text.rawValue)
                                            .build()
                    expect(router.process(request: aGetRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }

            context("when receive a HEAD request for an existing route") {
                it("returns an response with 200 OK status") {
                    let aHeadRequest = HttpRequest(method: RequestMethod.head, url: URL(string: "/demo")!, httpVersion: HttpVersion.current)
                    let expectedResponse = responseBuilder
                                            .withStatusCode(statusCode: StatusCode.ok.rawValue)
                                            .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                            .withContentType(contentType: ContentType.text.rawValue)
                                            .build()
                    expect(router.process(request: aHeadRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }
        }
    }
}
