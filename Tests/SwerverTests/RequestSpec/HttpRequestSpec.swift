import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestSpec: QuickSpec {

    override func spec() {
        describe("Comparing requests") {
            it("is true when attributes match") {
                let requestOne = HttpRequest(method: .get, url: TestData.validUrlOne())
                let requestTwo = HttpRequest(method: .get, url: TestData.validUrlOne())

                expect(requestOne).to(equal(requestTwo))
            }

            it("is false when the method does not match") {
                let requestOne = HttpRequest(method: .options, url: TestData.validUrlOne())
                let requestTwo = HttpRequest(method: .get, url: TestData.validUrlOne())

                expect(requestOne).notTo(equal(requestTwo))
            }

            it("is false when the URL does not match") {
                let requestOne = HttpRequest(method: .get, url: TestData.validUrlOne())
                let requestTwo = HttpRequest(method: .get, url: TestData.validUrlTwo())

                expect(requestOne).notTo(equal(requestTwo))
            }
        }
    }
}
