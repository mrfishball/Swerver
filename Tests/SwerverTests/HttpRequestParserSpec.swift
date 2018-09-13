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
                let aRequest = "GET / HTTP/1.1"
                let expectedRequest = HttpRequest(request: aRequest)
                let parsedRequest = httpRequestParser.parse(request: aRequest)
                expect(parsedRequest.toString()).to(equal(expectedRequest.toString()))
            }
        }
    }

}
