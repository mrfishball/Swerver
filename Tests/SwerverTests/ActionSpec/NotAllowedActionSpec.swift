import Quick
import Nimble
import Swerver
import Foundation

class NotAllowedActionSpec: QuickSpec {
    
    override func spec() {
        describe("A Not Allowed action") {
            func buildAction() -> HttpAction {
                return NotAllowedAction(methods: [RequestMethod.get.rawValue, RequestMethod.head.rawValue])
            }
            
            it("returns a response with a 405 status code") {
                let notAllowedAction = buildAction()

                let okResponse = notAllowedAction.execute()

                expect(okResponse.statusCode).to(equal(StatusCode.not_allowed.rawValue))
            }
            
            it("returns a response with a content type of text") {
                let notAllowedAction = buildAction()

                let okResponse = notAllowedAction.execute()

                expect(okResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("returns a response all the allowed methods in the allow header") {
                let notAllowedAction = buildAction()

                let okResponse = notAllowedAction.execute()

                expect(okResponse.get(header: .allow)).to(equal("GET,HEAD"))
            }
        }
    }
}
