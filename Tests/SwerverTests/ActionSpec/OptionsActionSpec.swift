import Quick
import Nimble
import Swerver
import Foundation

class OptionsActionSpec: QuickSpec {
    
    override func spec() {
        describe("A OPTIONS action") {
            func buildAction() -> HttpAction {
                return OptionsAction(methods: ["GET", "OPTIONS"])
            }
            
            it("returns a response with status code of 200") {
                let optionsAction = buildAction()
                
                let okResponse = optionsAction.execute()
                
                expect(okResponse.statusCode).to(equal(StatusCode.ok))
            }
            
            it("returns a response with content type text") {
                let optionsAction = buildAction()
                
                let okResponse = optionsAction.execute()
                
                expect(okResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("returns a response with the correct 'Allow' header") {
                let optionsAction = buildAction()
                
                let okResponse = optionsAction.execute()
                
                expect(okResponse.get(header: .allow)).to(equal("GET,OPTIONS"))
            }
        }
    }
}
