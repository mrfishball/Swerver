import Quick
import Nimble
import Swerver

class NotFoundActionSpec: QuickSpec {
    
    override func spec() {
        describe("A GET action") {
            let responseBuilder = ResponseBuilder()
            let notFoundAction = NotFoundAction()
            
            it("can dispatch to the response builder to build a response of resource not found") {
                let notFoundResponse = responseBuilder
                    .withStatusCode(statusCode: StatusCode.not_found.rawValue)
                    .withStatusPhrase(statusPhrase: StatusCode.not_found.getStatusPhrase())
                    .withContentType(contentType: ContentType.text.rawValue)
                    .withBody(body: String())
                    .build()
                expect(notFoundAction.dispatch()).to(equal(notFoundResponse))
            }
        }
    }
}
