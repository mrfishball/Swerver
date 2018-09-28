import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestSpec: QuickSpec {

    override func spec() {
        describe("HttpRequest") {
            var httpRequest = HttpRequest(method: RequestMethod.get, url: URL(string: Resource.test.rawValue), httpVersion: HttpVersion.current)

            it("can equate two request objects") {
                let httpRequest2 = HttpRequest(method: RequestMethod.get, url: URL(string: Resource.test.rawValue), httpVersion: HttpVersion.current)
                expect(httpRequest).to(equal(httpRequest2))
            }
        }
    }
}
