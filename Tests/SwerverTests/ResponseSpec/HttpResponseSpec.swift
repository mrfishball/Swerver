import Quick
import Nimble
import Swerver
import Foundation

class HttpResponseSpec: QuickSpec {
    override func spec() {
        describe("HttpResponse") {
            var responseBuilder = ResponseBuilder()
            
            it("can equate two response object") {
                let responseOne = responseBuilder
                                    .withStatusCode(statusCode: .ok)
                                    .withContentType(contentType: .text)
                                    .withBody(body: String())
                                    .build()
                
                let responseTwo = responseBuilder
                                    .withStatusCode(statusCode: .ok)
                                    .withContentType(contentType: .text)
                                    .withBody(body: String())
                                    .build()
                
                expect(responseOne).to(equal(responseTwo))
            }
        }
    }
}
