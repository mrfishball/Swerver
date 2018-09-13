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
            
            it("can return a string representation of the request") {
                expect(httpRequest.toString()).to(equal("GET / HTTP/1.1"))
            }
        }
    }

}
