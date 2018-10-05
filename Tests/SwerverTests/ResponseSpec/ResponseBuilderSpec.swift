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
                
                expect(responseStatusCode).to(equal("200"))
            }
            
            
            it("it can build a response object with a content type") {
                let responseToBeTested = responseBuilder
                                            .withContentType(contentType: .text)
                                            .build()
                let responseContentType = responseToBeTested.contentType
                expect(responseContentType).to(equal("text/html; charset=UTF-8"))
            }
            
            it("it can build a response object with a body") {
                let responseToBeTested = responseBuilder
                                            .withBody(body: "Hello World!")
                                            .build()
                let responseBody = responseToBeTested.body
                expect(responseBody).to(equal("Hello World!"))
            }
            
            it("can build a response object with a content length") {
                let responseToBeTested = responseBuilder
                    .withContentLength(contentLength: 200)
                    .build()
                let responseContentLength = responseToBeTested.contentLength
                expect(responseContentLength).to(equal(200))
            }
            
            it("can build a response object with an allowed methods list") {
                let listOfMethods = ["GET", "OPTIONS"]
                let responseToBeTested = responseBuilder
                    .withAllowedMethods(allowedMethods: listOfMethods)
                    .build()
                let responseAllowedMethods = responseToBeTested.allowedMethods
                expect(responseAllowedMethods).to(equal(listOfMethods))
            }
        }
    }
}
