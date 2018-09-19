import Quick
import Nimble
import Swerver
import Foundation

class RouterSpec: QuickSpec {
    override func spec() {
        describe("A Router") {
            var router: Router!
            var formatter: ResponseFormatter!
            var responseBuilder: ResponseConstructor!
            
            beforeEach {
                router = Router()
                formatter = ResponseFormatter()
                responseBuilder = ResponseConstructor()
            }
            
            context("when receive a GET request") {
                it("returns an response object with 200 OK status") {
                    let aGetRequest = HttpRequest(method: RequestMethods.get, url: URL(string: "/")!, httpVersion: HttpVersion.current)
                    let expectedResponse = responseBuilder.generate200OKResponse()
                    expect(router.process(request: aGetRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }

            context("when receive a request of type other than GET") {
                it("returns an response object with 501 Not Implemented status") {
                    let aGetRequest = HttpRequest(method: RequestMethods.other, url: URL(string: "/")!, httpVersion: HttpVersion.current)
                    let expectedResponse = responseBuilder.generate501NotImplementedResponse()
                    expect(router.process(request: aGetRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }
        }
    }
}
