import Quick
import Nimble
import Swerver
import Foundation

class HttpResponseSpec: QuickSpec {
    override func spec() {
        describe("HttpResponse") {
            var httpResponse: HttpResponse!
            
            beforeEach {
                httpResponse = HttpResponse(statusCode: "200", statusPhrase: "OK")
            }
            
            it("has a default content type of 'test/html; charset=UTF-8'") {
                let expectedContentType: String = "text/html; charset=UTF-8"
                expect(httpResponse.getContentType()).to(equal(expectedContentType))
            }
            
            it("can return the date and time string of when the response is created") {
                expect(httpResponse.getResponseDateTime()).toNot(be(nil))
            }
            
            it("can return the status line item in the header") {
                let expectedStatusLineItem = "HTTP/1.1 200 OK\r\n"
                expect(httpResponse.statusLineToHeaderItem()).to(equal(expectedStatusLineItem))
            }
            
            it("can return the content type as a line item") {
                let expectedContentTypeLineItem = "Content-Type: text/html; charset=UTF-8\r\n"
                expect(httpResponse.contentTypeToHeaderItem()).to(equal(expectedContentTypeLineItem))
            }
            
            it("can return the date and time as a line item") {
                let expectedDateTimeLineItem = "Date: \(httpResponse.getResponseDateTime())\r\n"
                expect(httpResponse.dateTimeToHeaderItem()).to(equal(expectedDateTimeLineItem))
            }
            
            it("can return a string representation of the entire response object") {
                let expectedResponseString = "HTTP/1.1 200 OK\r\nContent-Type: text/html; charset=UTF-8\r\nDate: \(httpResponse.getResponseDateTime())\r\n\r\n<h1>200 OK</h1>"
                expect(httpResponse.responseDataToString()).to(equal(expectedResponseString))
            }
        }
    }
}
