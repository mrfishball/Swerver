import Quick
import Nimble
import Swerver

class GetActionSpec: QuickSpec {
    
    override func spec() {
        describe("A GET action") {
            let getAction = GetAction()
            let responseBuilder = ResponseBuilder()
            
            it("can dispatch to response builder to build a response for a successful GET request") {
                let okResponse = responseBuilder
                    .withStatusCode(statusCode: StatusCode.ok.rawValue)
                    .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                    .withContentType(contentType: ContentType.text.rawValue)
                    .withBody(body: String())
                    .build()
                expect(getAction.dispatch()).to(equal(okResponse))
            }
        }
    }
}
