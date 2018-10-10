import Quick
import Nimble
import Swerver
import Foundation

class RedirectActionSpec: QuickSpec {
    
    override func spec() {
        describe("A Redirect action") {
            guard let url = URL(string: Resource.test_redirect.rawValue) else {
                return
            }
            let redirectAction = RedirectAction(redirectPath: url)
            
            it("can dispatch to response builder to build a response with a 301 status code") {
                let expectResponse = redirectAction.execute()
                expect(expectResponse.statusCode).to(equal(StatusCode.moved.rawValue))
                
            }
            
            it("can dispatch to response builder to build a response with a location header") {
                let expectResponse = redirectAction.execute()
                expect(expectResponse.get(header: .location)).toNot(beNil())
            }
            
            it("can dispatch to response builder to build a response with an empty body") {
                let expectResponse = redirectAction.execute()
                expect(expectResponse.get(header: .contentLength)).to(equal("0"))
            }
        }
    }
}
