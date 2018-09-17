import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestParserSpec: QuickSpec {
    override func spec() {
        describe("An HTTP Request Parser") {
            var httpRequestParser: HttpRequestParser!
            
            beforeEach {
                httpRequestParser = HttpRequestParser()
            }
            
            it("returns an HttpRequest Object") {
                let requestData = "GET / HTTP/1.1"
                let expectedRequest = HttpRequest(method: "GET", url: "/", httpVersion: "HTTP/1.1")
                let parsedRequest = httpRequestParser.parse(request: requestData)
                expect(parsedRequest).to(equal(expectedRequest))
            }
        }
    }

}
