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
                    let aGetRequest = HttpRequest(method: RequestMethods.GET, url: URL(string: "/")!, httpVersion: HttpVersion.current)
                    let expectedResponse = HttpResponse(statusCode: RequestStatus.success.getStatusCode(), statusPhrase: RequestStatus.success.getStatusPhrase())
                    expect(router.process(request: aGetRequest)).to(equal(expectedResponse))
                }
            }
            
            context("when receive a request of type other than GET") {
                it("returns an response object with 501 Not Implemented status") {
                    let aGetRequest = HttpRequest(method: RequestMethods.OTHER, url: URL(string: "/")!, httpVersion: HttpVersion.current)
                    let expectedResponse = HttpResponse(statusCode: RequestStatus.failed.getStatusCode(), statusPhrase: RequestStatus.failed.getStatusPhrase())
                    expect(router.process(request: aGetRequest)).to(equal(expectedResponse))
                }
            }
        }
    }
}
