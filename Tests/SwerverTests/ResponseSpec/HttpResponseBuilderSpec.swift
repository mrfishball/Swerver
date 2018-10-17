import Quick
import Nimble
import Swerver

class HttpResponseBuilderSpec: QuickSpec {
    override func spec() {
        describe("A HTTP Response Builder") {
            func buildBuilder() -> HttpResponseBuilder {
                return HttpResponseBuilder()
            }
            
            it("builds a response object with an 200 status code") {
                let responseBuilder = buildBuilder()
                let responseToBeTested = responseBuilder
                    .with(statusCode: .ok)
                    .build()
                
                let expectedStatusCode = responseToBeTested.statusCode
                
                expect(expectedStatusCode).to(equal(StatusCode.ok.rawValue))
            }
            
            
            it("builds a response object with a content type") {
                let responseBuilder = buildBuilder()
                let responseToBeTested = responseBuilder
                    .with(contentType: .text)
                    .build()
                
                let expectedContentType = responseToBeTested.get(header: .contentType)

                expect(expectedContentType).to(equal(ContentType.text.rawValue))
            }
            
            it("gives a response object a body") {
                let responseBuilder = buildBuilder()
                let responseToBeTested = responseBuilder
                    .with(body: "Hello World!")
                    .build()
                
                let expectedBody = responseToBeTested.body
                
                expect(expectedBody).to(equal("Hello World!"))
            }
            
            it("sets the content length according to the length of the body") {
                let responseBuilder = buildBuilder()
                let body = "Hello World!"
                let responseToBeTested = responseBuilder
                    .with(body: body)
                    .build()
                
                let expectedContentLength = responseToBeTested.get(header: .contentLength)
                
                expect(expectedContentLength).to(equal(String(body.count)))
            }
            
            it("sets the allow header") {
                let responseBuilder = buildBuilder()
                let allowedMethodString = "GET, OPTIONS"
                let responseToBeTested = responseBuilder
                    .set(header: .allow, value: allowedMethodString)
                    .build()
                
                let expectedAllowHeader = responseToBeTested.get(header: .allow)
                
                expect(expectedAllowHeader).to(equal(allowedMethodString))
            }
        }
    }
}
