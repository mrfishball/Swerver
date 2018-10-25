import Quick
import Nimble
import Swerver

class NotFoundActionSpec: QuickSpec {
    
    override func spec() {
        describe("A Not Found action") {
            func buildAction() -> HttpAction {
                return NotFoundAction()
            }
            
            it("returns a response with a 404 status code") {
                let notFoundAction = buildAction()

                let notFoundResponse = notFoundAction.execute()

                expect(notFoundResponse.statusCode).to(equal(StatusCode.not_found))
            }
            
            it("returns a response with a content type of text") {
                let notFoundAction = buildAction()

                let notFoundResponse = notFoundAction.execute()

                expect(notFoundResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
        }
    }
}
