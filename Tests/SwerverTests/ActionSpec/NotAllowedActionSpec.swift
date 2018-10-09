import Quick
import Nimble
import Swerver
import Foundation

class NotAllowedActionSpec: QuickSpec {
    
    override func spec() {
        describe("A Not Allowed action") {
            let listOfAllowedMethods = ["GET", "POST"]
            
            let notAllowedAction = NotAllowedAction(methods: listOfAllowedMethods)
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request") {
                
                let okResponse = notAllowedAction.execute()
                expect(okResponse.statusCode).to(equal(StatusCode.not_allowed.rawValue))
                expect(okResponse.headers[.contentType]).to(equal(ContentType.text.rawValue))
                expect(okResponse.headers[.allow]).to(equal("GET, POST"))
            }
        }
    }
}
