import Quick
import Nimble
import Swerver

class SwerverCoreTests: QuickSpec {
    override func spec() {
        describe("An HTTP server") {
            let server = Swerver(port: 5050)
            
            context("when the server is running") {
                it("must be able to accept a connection") {
                    expect(server.connected).to(equal(true))
                }
            }
        }
    }
}
