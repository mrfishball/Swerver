import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestParserSpec: QuickSpec {
    override func spec() {
        describe("An HTTP Request Parser") {
            var httpRequestParser = HttpRequestParser()

            it("returns an HttpRequest Object") {
                let requestData = "GET / HTTP/1.1"
                let parsedRequest = httpRequestParser.parse(request: requestData)
                expect(parsedRequest?.getHttpVersion()).to(equal(HttpVersion.current))
                expect(parsedRequest?.getUrl()).to(equal(URL(string: "/")))
                expect(parsedRequest?.getMethod()).to(equal(RequestMethod.get))
            }
        }
    }
}
