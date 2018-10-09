import Quick
import Nimble
import Swerver

class ResponseBuilderSpec: QuickSpec {
    override func spec() {
        describe("A ResponseBuilder") {
            var responseBuilder = ResponseBuilder()
            
            it("it can build a response object with an 200 status code") {
                let responseToBeTested = responseBuilder
                                            .withStatusCode(statusCode: .ok)
                                            .build()
                let responseStatusCode = responseToBeTested.statusCode
                
                expect(responseStatusCode).to(equal(StatusCode.ok.rawValue))
            }
            
            
            it("it can build a response object with a content type") {
                let responseToBeTested = responseBuilder
                                            .withContentType(contentType: .text)
                                            .build()

                expect(responseToBeTested.headers[.contentType]).to(equal(ContentType.text.rawValue))
            }
            
            it("it can build a response object with a body") {
                let responseToBeTested = responseBuilder
                                            .withBody(body: "Hello World!")
                                            .build()
                let responseBody = responseToBeTested.body
                expect(responseBody).to(equal("Hello World!"))
            }
            
            it("can set the content length according to the length of the body") {
                let body = "Hello World!"
                let responseToBeTested = responseBuilder
                    .withBody(body: body)
                    .build()

                expect(responseToBeTested.headers[.contentLength]).to(equal(String(body.count)))
            }
            
            it("can set the allow header") {
                let allowedMethodString = "\(RequestMethod.get.rawValue), \(RequestMethod.options.rawValue)"
                responseBuilder.setHeader(header: .allow, value: allowedMethodString)
                let responseToBeTested = responseBuilder
                    .build()
                expect(responseToBeTested.headers[.allow]).to(equal(allowedMethodString))
            }
        }
    }
}
