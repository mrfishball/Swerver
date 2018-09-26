import Quick
import Nimble
import Swerver

class HeadActionSpec: QuickSpec {
    
    override func spec() {
        describe("A HEAD action") {
            let responseBuilder = ResponseBuilder()
            let headAction = HeadAction(builder: responseBuilder)
            
            it("can dispatch to response builder to build a response for a successful HEAD request") {
                let okResponse = responseBuilder
                    .withStatusCode(statusCode: StatusCode.ok.rawValue)
                    .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                    .withContentType(contentType: ContentType.text.rawValue)
                    .build()
                expect(headAction.dispatch()).to(equal(okResponse))
            }
        }
    }
}
