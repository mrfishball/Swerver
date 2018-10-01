import Quick
import Nimble
import Swerver

class NotFoundActionSpec: QuickSpec {
    
    override func spec() {
        describe("A Not Found action") {
            let responseBuilder = ResponseBuilder()
            let notFoundAction = NotFoundAction()
            
            it("can execute to the response builder to build a response of resource not found") {
                let notFoundResponse = notFoundAction.execute()

                expect(notFoundResponse.statusCode).to(equal(StatusCode.not_found.rawValue))
                expect(notFoundResponse.statusPhrase).to(equal(StatusCode.not_found.getStatusPhrase()))
                expect(notFoundResponse.contentType).to(equal(ContentType.text.rawValue))
                expect(notFoundResponse.body.count).to(equal(0))
            }
        }
    }
}
