import Quick
import Nimble
import Swerver
import Foundation

class RouterSpec: QuickSpec {
    override func spec() {
        describe("A Router") {
            var router: Router!
            
            beforeEach {
                router = Router()
            }
            
            context("when receive a GET request") {
                it("returns an response object with 200 OK status") {
                    let aGetRequest = HttpRequest(method: "GET", url: "/", httpVersion: "HTTP/1.1")
                    let expectedResponse = HttpResponse(statusCode: RequestStatus.SUCCESS.getStatusCode(), statusPhrase: RequestStatus.SUCCESS.getStatusPhrase())
                    expect(router.process(request: aGetRequest)).to(equal(expectedResponse))
                }
            }
            
            context("when receive a request of type other than GET") {
                it("returns an response object with 501 Not Implemented status") {
                    let aGetRequest = HttpRequest(method: "POST", url: "/", httpVersion: "HTTP/1.1")
                    let expectedResponse = HttpResponse(statusCode: RequestStatus.FAILED.getStatusCode(), statusPhrase: RequestStatus.FAILED.getStatusPhrase())
                    expect(router.process(request: aGetRequest)).to(equal(expectedResponse))
                }
            }
        }
    }
}
