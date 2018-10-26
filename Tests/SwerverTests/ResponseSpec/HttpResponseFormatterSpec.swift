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
            
            func buildDefaultResponse() -> HttpResponse {
                return HttpResponseBuilder()
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .set(header: .allow, value: "GET")
                    .with(body: "Hello")
                    .build()
            }

            func buildRedirectResponse() -> HttpResponse {
                return HttpResponseBuilder()
                    .with(statusCode: .moved)
                    .set(header: .location, value: TestData.validUrlTwo().absoluteString)
                    .build()
            }

            it("returns a string object") {
                let formatter = buildFormatter()
                let response = buildDefaultResponse()

                let formattedResponse = formatter.format(httpResponse: response)
                
                expect(type(of: formattedResponse) == String.self).to(beTrue())
            }
            
            it("formats a response object") {
                let formatter = buildFormatter()
                let response = buildDefaultResponse()
                
                let formattedResponse = formatter.format(httpResponse: response)
                
                let statusLine = "HTTP/1.1 200 OK\r\n"
                let headersLine = "Allow: GET\r\nContent-Length: 5\r\nContent-Type: text/html; charset=UTF-8\r\nDate: \(HttpResponseFormatter.formatDateTime(response: response))\r\n\r\n"
                let body = "Hello"
                let result = statusLine + headersLine + body
                
                expect(formattedResponse).to(equal(result))
            }

            context("when response object has a location header") {
                it("formats the location header to include the host's URI") {
                    let formatter = buildFormatter()
                    let response = buildRedirectResponse()
                    let host = "http://localhost:5000"

                    formatter.setHost(host: host)
                    let formattedResponse = formatter.format(httpResponse: response)

                    let statusLine = "HTTP/1.1 301 Moved Permanently\r\n"
                    let headersLine = "Content-Length: 0\r\nLocation: \(host)\(TestData.validUrlTwo().absoluteString)\r\nDate: \(HttpResponseFormatter.formatDateTime(response: response))\r\n\r\n"

                    let result = statusLine + headersLine

                    expect(formattedResponse).to(equal(result))
                }
            }
        }
    }
}
