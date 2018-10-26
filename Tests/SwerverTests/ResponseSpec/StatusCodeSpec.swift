import Quick
import Nimble
import Swerver

class StatusCodeSpec: QuickSpec {
    override func spec() {
        describe("A StatusCode enum") {
            
            it("returns a status phrase of 'OK'") {
                expect(StatusCode.ok.getStatusPhrase()).to(equal("OK"))
            }
            
            it("returns a status phrase of 'Not Found'") {
                expect(StatusCode.notFound.getStatusPhrase()).to(equal("Not Found"))
            }
            
            it("returns a status phrase of 'Method Not Allowed'") {
                expect(StatusCode.notAllowed.getStatusPhrase()).to(equal("Method Not Allowed"))
            }
        }
    }
}
