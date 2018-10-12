import Quick
import Nimble
import Swerver

class ResponseBuilderSpec: QuickSpec {
    override func spec() {
        describe("A ResponseBuilder") {
            var responseBuilder = ResponseBuilder()
            
            it("it can build a response object with an 200 status code") {
                let responseToBeTested = responseBuilder
                                            .with(statusCode: .ok)
                                            .build()
                let responseStatusCode = responseToBeTested.statusCode
                
                expect(responseStatusCode).to(equal(StatusCode.ok.rawValue))
            }
            
            
            it("it can build a response object with a content type") {
                let responseToBeTested = responseBuilder
                                            .with(contentType: .text)
                                            .build()

                expect(responseToBeTested.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("it can build a response object with a body") {
                let responseToBeTested = responseBuilder
                                            .with(body: "Hello World!")
                                            .build()
                let responseBody = responseToBeTested.body
                expect(responseBody).to(equal("Hello World!"))
            }
            
            it("can set the content length according to the length of the body") {
                let body = "Hello World!"
                let responseToBeTested = responseBuilder
                    .with(body: body)
                    .build()

                expect(responseToBeTested.get(header: .contentLength)).to(equal(String(body.count)))
            }
            
            it("can set the allow header") {
                let allowedMethodString = "\(RequestMethod.get.rawValue), \(RequestMethod.options.rawValue)"
                responseBuilder.set(header: .allow, value: allowedMethodString)
                let responseToBeTested = responseBuilder
                    .build()
                expect(responseToBeTested.get(header: .allow)).to(equal(allowedMethodString))
            }
        }
    }
}
