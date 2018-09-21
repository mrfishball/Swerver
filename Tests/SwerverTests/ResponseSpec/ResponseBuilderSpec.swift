import Quick
import Nimble
import Swerver

class ResponseBuilderSpec: QuickSpec {
    override func spec() {
        describe("A ResponseBuilder") {
            var responseBuilder: ResponseBuilder!
            
            beforeEach {
                responseBuilder = ResponseBuilder()
            }
            
            it("it can build a response object with an 200 status code") {
                let responseToBeTested = responseBuilder
                                            .withStatusCode(statusCode: StatusCode.ok.rawValue)
                                            .build()
                let responseStatusCode = responseToBeTested.statusCode
                
                expect(responseStatusCode).to(equal("200"))
            }
            
            it("it can build a response object with an OK status phrase") {
                let responseToBeTested = responseBuilder
                                            .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                            .build()
                let responseStatusPhrase = responseToBeTested.statusPhrase
                
                expect(responseStatusPhrase).to(equal("OK"))
            }
            
            it("it can build a response object with a content type") {
                let responseToBeTested = responseBuilder
                                            .withContentType(contentType: ContentType.text.rawValue)
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

        }
    }
}
