import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestSpec: QuickSpec {

    override func spec() {
        describe("HttpRequest") {
            var httpRequest: HttpRequest!
            
            beforeEach {
                httpRequest = HttpRequest(method: "GET", url: "/", httpVersion: "HTTP/1.1")
            }
            
            it("can return the method of the request") {
                expect(httpRequest.getMethod()).to(equal("GET"))
            }
            
            it("can return the url of the request") {
                expect(httpRequest.getUrl()).to(equal("/"))
            }
            
            it("can return the http version of the request") {
                expect(httpRequest.getHttpVersion()).to(equal("HTTP/1.1"))
            }
        }
    }

}
