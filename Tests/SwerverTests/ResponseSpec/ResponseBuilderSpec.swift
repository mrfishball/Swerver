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
            
            it("it builds a response object that has a data value") {
                let responseToBeTested = responseBuilder.build()
                let expectedDate: String = responseToBeTested.getHeaderComponents()["Date"]!
                
                expect(expectedDate).toNot(beNil())
            }
            
            it("can build a response with a status code value and a date value") {
                let responseToBeTested = responseBuilder
                                            .setStatusCode(statusCode: StatusCode.ok.rawValue)
                                            .build()
                var expectedResponse = HttpResponse(statusCode: StatusCode.ok.rawValue, statusPhrase: String(), body: String())
                expectedResponse.setResponseContentType(contentType: String())
                expectedResponse.setResponseDateTime(dateTime: responseToBeTested.getResponseDateTime())
                
                expect(responseToBeTested).to(equal(expectedResponse))
            }
            
            it("can build a response with all the values in its field") {
                let responseToBeTested = responseBuilder
                                            .setStatusCode(statusCode: StatusCode.ok.rawValue)
                                            .setStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                            .setContentType(contentType: ContentType.text.rawValue)
                                            .setBody(body: "This is a response")
                                            .build()
                var expectedResponse = HttpResponse(statusCode: StatusCode.ok.rawValue, statusPhrase: StatusCode.ok.getStatusPhrase(), body: "This is a response")
                expectedResponse.setResponseContentType(contentType: ContentType.text.rawValue)
                expectedResponse.setResponseDateTime(dateTime: responseToBeTested.getResponseDateTime())
                
                expect(responseToBeTested).to(equal(expectedResponse))
            }
        }
    }
}
