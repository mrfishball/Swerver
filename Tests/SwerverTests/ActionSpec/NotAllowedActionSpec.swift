import Quick
import Nimble
import Swerver
import Foundation

class NotAllowedActionSpec: QuickSpec {
    
    override func spec() {
        describe("A Not Allowed action") {
            
            let notAllowedAction = NotAllowedAction(methods: [RequestMethod.get.rawValue, RequestMethod.head.rawValue])
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request with a 405 status code") {
                let okResponse = notAllowedAction.execute()
                expect(okResponse.statusCode).to(equal(StatusCode.not_allowed.rawValue))
            }
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request with a content type of text") {
                let okResponse = notAllowedAction.execute()
                expect(okResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request with all the allowed methods in the allow header") {
                let okResponse = notAllowedAction.execute()
                expect(okResponse.get(header: .allow)).to(equal("GET,HEAD"))
            }
        }
    }
}
