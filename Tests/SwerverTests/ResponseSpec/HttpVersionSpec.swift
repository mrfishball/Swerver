import Quick
import Nimble
import Swerver

class HttpVersionSpec: QuickSpec {
    override func spec() {
        describe("An HttpVersion enum") {
            it("has a raw value of 'HTTP/1.1'") {
                expect(HttpVersion.current.rawValue).to(equal("HTTP/1.1"))
            }
        }
    }
}
