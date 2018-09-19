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
                let expectedRequest = HttpRequest(method: RequestMethods.GET, url: URL(string: "/")!, httpVersion: HttpVersion.current)
                let parsedRequest = httpRequestParser.parse(request: requestData)
                print(parsedRequest.getHttpVersion())
                print(parsedRequest.getUrl())
                print(parsedRequest.getMethod())

                print(expectedRequest.getHttpVersion())
                print(expectedRequest.getUrl())
                print(expectedRequest.getMethod())
                expect(parsedRequest).to(equal(expectedRequest))
            }
        }
    }
}
