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
            
            context("when receive a request") {
                it("returns an response object") {
                    let aGetRequest = HttpRequest(method: "GET", url: "/", httpVersion: "HTTP/1.1")
                    let expectedResponse = HttpResponse(header: RequestMethods.GET.getHeader(), payload: RequestMethods.GET.getBody())
                    expect(router.process(request: aGetRequest)).to(equal(expectedResponse))
                }
            }
        }
    }
}
