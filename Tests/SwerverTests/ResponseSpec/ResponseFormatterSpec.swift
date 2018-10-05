import Quick
import Nimble
import Swerver
import Foundation

class ResponseFormatterSpec: QuickSpec {

    override func spec() {
        describe("A ResponseFormatter") {
            var formatter = ResponseFormatter()
            var responseBuilder = ResponseBuilder()
            
            it("formats a Response object into a String object") {
                let aResponse = responseBuilder
                                    .withStatusCode(statusCode: .ok)
                                    .withBody(body: "200 OK")
                                    .build()

                let formattedResponse = formatter.format(httpResponse: aResponse)
                
                let statusLine = "HTTP/1.1 200 OK\r\n"
                let headersLine = "Date: \(ResponseFormatter.formatDateTime(response: aResponse))\r\nContent-Type: \r\nContent-Length: 0\r\n\r\n"
                let body = "200 OK"

                var expectedResponse = statusLine + headersLine + body

                expect(formattedResponse).to(equal(expectedResponse))
            }
        }
    }
}
