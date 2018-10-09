import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestSpec: QuickSpec {

    override func spec() {
        describe("HttpRequest") {
            guard let url = URL(string: "/") else {
                return
            }
            var httpRequest = HttpRequest(method: RequestMethod.get, url: url)
            var httpRequest2 = HttpRequest(method: RequestMethod.get, url: url)

            var httpRequest3 = HttpRequest(method: RequestMethod.head, url: url)
            
            it("can equate two request objects") {
                expect(httpRequest).to(equal(httpRequest2))
                expect(httpRequest3).toNot(equal(httpRequest2))
            }
        }
    }
}
