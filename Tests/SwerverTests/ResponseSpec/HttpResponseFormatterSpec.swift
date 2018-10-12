import Quick
import Nimble
import Swerver
import Foundation

class HttpResponseFormatterSpec: QuickSpec {
    
    override func spec() {
        describe("A HTTP Response Formatter") {
            func buildFormatter() -> HttpResponseFormatter {
                return HttpResponseFormatter()
            }
            
            func defaultResponseBuilder() -> HttpResponse {
                return HttpResponseBuilder()
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .set(header: .allow, value: "GET")
                    .with(body: "Hello")
                    .build()
            }
            
            it("returns a string object") {
                let formatter = buildFormatter()
                
                let response = defaultResponseBuilder()
                
                let formattedResponse = formatter.format(httpResponse: response)
                
                expect(type(of: formattedResponse) == String.self).to(beTrue())
            }
            
            it("formats a response object") {
                let formatter = buildFormatter()
                
                let response = defaultResponseBuilder()
                
                let formattedResponse = formatter.format(httpResponse: response)
                
                let statusLine = "HTTP/1.1 200 OK\r\n"
                let headersLine = "Allow: GET\r\nContent-Length: 5\r\nContent-Type: text/html; charset=UTF-8\r\nDate: \(HttpResponseFormatter.formatDateTime(response: response))\r\n\r\n"
                let body = "Hello"
                
                var result = statusLine + headersLine + body
                
                expect(formattedResponse).to(equal(result))
            }
        }
    }
}
