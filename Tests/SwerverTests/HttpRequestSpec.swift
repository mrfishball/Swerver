import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestSpec: QuickSpec {

    override func spec() {
        describe("HttpRequest") {
            var httpRequest: HttpRequest!
            
            beforeEach {
                httpRequest = HttpRequest(request: "GET / HTTP/1.1")
            }
            
            it("can return an HttpRequest object") {
                let expectedRequest = HttpRequest(request: "GET / HTTP/1.1")
                expect(httpRequest).to(equal(expectedRequest))
            }
        }
    }

}
