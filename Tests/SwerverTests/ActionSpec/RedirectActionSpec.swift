import Quick
import Nimble
import Swerver
import Foundation

class RedirectActionSpec: QuickSpec {
    
    override func spec() {
        describe("A Redirect action") {
            func buildAction() -> HttpAction {
                return RedirectAction(redirectPath: TestData.redirectURL())
            }
            
            it("returns a response with a 301 status code") {
                let redirectAction = buildAction()
                
                let expectResponse = redirectAction.execute()
                
                expect(expectResponse.statusCode).to(equal(StatusCode.moved.rawValue))
                
            }
            
            it("returns a response with a location header") {
                let redirectAction = buildAction()
                
                let expectResponse = redirectAction.execute()
                
                expect(expectResponse.get(header: .location)).toNot(beNil())
            }
        }
    }
}
