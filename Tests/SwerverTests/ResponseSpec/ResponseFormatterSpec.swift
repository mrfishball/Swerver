import Quick
import Nimble
import Swerver
import Foundation

class ResponseFormatterSpec: QuickSpec {

    override func spec() {
        describe("A ResponseFormatter") {
            var formatter: ResponseFormatter!
            var responseBuilder: ResponseConstructor!
            
            beforeEach {
                formatter = ResponseFormatter()
                responseBuilder = ResponseConstructor()
            }
            
            it("format a Response object into a String object") {
                let aResponse = responseBuilder.generate200OKResponse()
                
                let statusLine = "HTTP/1.1 200 OK\r\n"
                let headersLine = "Date: \(aResponse.getResponseDateTime())\r\nContent-Type: text/html; charset=UTF-8\r\n\r\n"
                let body = "200 OK"
                
                var expectedResponse = statusLine + headersLine + body
                
                expect(formatter.format(httpResponse: aResponse)).to(equal(expectedResponse))
            }
        }
    }
}
