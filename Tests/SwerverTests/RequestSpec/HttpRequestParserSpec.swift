import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestParserSpec: QuickSpec {
    override func spec() {
        describe("Parsing the request") {

            func buildParser() -> HttpRequestParser {
                return HttpRequestParser()
            }

            context("when the request string is valid ") {
                let requestLine = "GET / HTTP/1.1"

                it("returns a valid request")  {
                    let requestParser = buildParser()

                    let parsedRequest = requestParser.parse(request: requestLine)

                    expect(parsedRequest).notTo(beNil())
                }

                it("parses the request method") {
                    let requestParser = buildParser()

                    let parsedRequest = requestParser.parse(request: requestLine)

                    expect(parsedRequest?.getMethod()).to(equal(RequestMethod.get))
                }

                it("returns an HttpRequest Object with the URL") {
                    let requestParser = buildParser()

                    let parsedRequest = requestParser.parse(request: requestLine)

                    expect(parsedRequest?.getUrl()).to(equal(URL(string: "/")))
                }
            }

            context("when the request string is invalid") {

                it("returns nil") {
                    let requestParser = buildParser()
                    let requestData = "Invalid Request"

                    let parsedRequest = requestParser.parse(request: requestData)

                    expect(parsedRequest).to(beNil())
                }
            }

        }
    }
}
