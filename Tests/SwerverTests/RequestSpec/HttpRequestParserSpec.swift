import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestParserSpec: QuickSpec {
    override func spec() {
        describe("An HTTP Request Parser") {
            var httpRequestParser = HttpRequestParser()

            context("when the request string is valid ") {
                let requestData = "GET / HTTP/1.1"
                let parsedRequest = httpRequestParser.parse(request: requestData)
                
                it("returns an HttpRequest Object with the request method") {
                    expect(parsedRequest?.getMethod()).to(equal(RequestMethod.get))
                }
                
                it("returns an HttpRequest Object with the URL") {
                    expect(parsedRequest?.getUrl()).to(equal(URL(string: "/")))
                }
                
                it("returns an HttpRequest Object with the http version") {
                    expect(parsedRequest?.getHttpVersion()).to(equal(HttpVersion.current))
                }
            }
            
            context("when the request string is invalid") {
                it("returns nil") {
                    let requestData = "Invalid Request"
                    let parsedRequest = httpRequestParser.parse(request: requestData)
                    expect(parsedRequest).to(beNil())
                }
            }
            
        }
    }
}
