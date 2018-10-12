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
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .with(body: String())
                    .build()
                
                let responseTwo = responseBuilder
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .with(body: String())
                    .build()
                
                expect(responseOne).to(equal(responseTwo))
            }
            
            it("can differentiate two response object") {
                let responseOne = responseBuilder
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .with(body: String())
                    .build()
                
                let responseTwo = responseBuilder
                    .with(statusCode: .not_found)
                    .with(contentType: .text)
                    .with(body: String())
                    .build()
                expect(responseOne).toNot(equal(responseTwo))
            }
            
            it("can retrieve other headers such as the content type of a response") {
                let response = responseBuilder
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .with(body: String())
                    .build()
                
                expect(response.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
        }
    }
}
