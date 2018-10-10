import Quick
import Nimble
import Swerver

class HeadActionSpec: QuickSpec {

    override func spec() {
        describe("A HEAD action") {
            let headAction = HeadAction()

            it("can dispatch to response builder to build a response for a successful HEAD request with a 200 status code") {
                let expectResponse = headAction.execute()
                expect(expectResponse.statusCode).to(equal(StatusCode.ok.rawValue))
            }
            
            it("can dispatch to response builder to build a response for a successful HEAD request with a content type of text") {
                let expectResponse = headAction.execute()
                expect(expectResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("can dispatch to response builder to build a response for a successful HEAD request with an empty body") {
                let expectResponse = headAction.execute()
                expect(expectResponse.body.count).to(equal(0))
            }
        }
    }
}
