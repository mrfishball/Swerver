import Quick
import Nimble
import Swerver

class HeadActionSpec: QuickSpec {

    override func spec() {
        describe("A HEAD action") {
            func buildAction() -> HttpAction {
                return HeadAction()
            }

            it("returns a response with a 200 status code") {
                let headAction = buildAction()

                let expectResponse = headAction.execute()

                expect(expectResponse.statusCode).to(equal(StatusCode.ok.rawValue))
            }
            
            it("returns a response with a content type of text") {
                let headAction = buildAction()

                let expectResponse = headAction.execute()

                expect(expectResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
        }
    }
}
