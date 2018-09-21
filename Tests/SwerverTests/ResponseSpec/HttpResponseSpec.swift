import Quick
import Nimble
import Swerver
import Foundation

class HttpResponseSpec: QuickSpec {
    override func spec() {
        describe("HttpResponse") {
            var responseBuilder: ResponseBuilder!
            
            beforeEach {
                responseBuilder = ResponseBuilder()
            }
            
            it("can equate two response object") {
                let responseOne = responseBuilder
                                    .withStatusCode(statusCode: StatusCode.ok.rawValue)
                                    .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                    .withContentType(contentType: ContentType.text.rawValue)
                                    .withBody(body: String())
                                    .build()
                
                let responseTwo = responseBuilder
                                    .withStatusCode(statusCode: StatusCode.ok.rawValue)
                                    .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                    .withContentType(contentType: ContentType.text.rawValue)
                                    .withBody(body: String())
                                    .build()
                
                expect(responseOne).to(equal(responseTwo))
            }
        }
    }
}
