import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestSpec: QuickSpec {

    override func spec() {
        describe("HttpRequest") {
            var httpRequest: HttpRequest!
            
            beforeEach {
                httpRequest = HttpRequest(method: RequestMethods.GET, url: URL(string: "/")!, httpVersion: HttpVersion.current)
            }
            
            it("can return the method of the request") {
                expect(httpRequest.getMethod()).to(equal(RequestMethods.GET))
            }
            
            it("can return the url of the request") {
                expect(httpRequest.getUrl().absoluteString).to(equal("/"))
            }
            
            it("can return the http version of the request") {
                expect(httpRequest.getHttpVersion()).to(equal(HttpVersion.current))
            }
        }
    }

}
