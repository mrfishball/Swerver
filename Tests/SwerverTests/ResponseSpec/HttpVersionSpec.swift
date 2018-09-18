import Quick
import Nimble
import Swerver
import Foundation

class HttpVersionSpec: QuickSpec {
    override func spec() {
        describe("An HttpVersion enum") {
            it("can return the current version of the HTTP protocol") {
                expect(HttpVersion.CURRENT.rawValue).to(equal("HTTP/1.1"))
            }
        }
    }

}
