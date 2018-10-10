import Quick
import Nimble
import Swerver

class NotFoundActionSpec: QuickSpec {
    
    override func spec() {
        describe("A GET action") {
            let notFoundAction = NotFoundAction()
            
            it("can dispatch to the response builder to build a response of resource not found with a 404 status code") {
                let notFoundResponse = notFoundAction.execute()
                expect(notFoundResponse.statusCode).to(equal(StatusCode.not_found.rawValue))
            }
            
            it("can dispatch to the response builder to build a response of resource not found with a content type of text") {
                let notFoundResponse = notFoundAction.execute()
                expect(notFoundResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("can dispatch to the response builder to build a response of resource not found with an empty body") {
                let notFoundResponse = notFoundAction.execute()
                expect(notFoundResponse.body.count).to(equal(0))
            }
        }
    }
}
