import Quick
import Nimble
import Swerver
import Foundation

class ResponseFormatterSpec: QuickSpec {

    override func spec() {
        describe("A ResponseFormatter") {
            var formatter: ResponseFormatter!
            var responseBuilder: ResponseBuilder!
            
            beforeEach {
                formatter = ResponseFormatter()
                responseBuilder = ResponseBuilder()
            }
            
            it("formats a Response object into a String object") {
                let aResponse = responseBuilder
                                    .setStatusCode(statusCode: StatusCode.ok.rawValue)
                                    .setStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                    .setBody(body: "200 OK")
                                    .build()

                let statusLine = "HTTP/1.1 200 OK\r\n"
                let headersLine = "Date: \(aResponse.getResponseDateTime())\r\nContent-Type: \r\n\r\n"
                let body = "200 OK"
                
                var expectedResponse = statusLine + headersLine + body

                expect(formatter.format(httpResponse: aResponse)).to(equal(expectedResponse))
            }
        }
    }
}
