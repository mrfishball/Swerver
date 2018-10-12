import Quick
import Nimble
import Swerver

class GetActionSpec: QuickSpec {

    override func spec() {
        describe("A GET action") {
            func buildAction() -> GetAction {
                return GetAction()
            }

            it("returns a response with status code of 200") {
                let getAction = buildAction()

                let expectResponse = getAction.execute()

                expect(expectResponse.statusCode).to(equal(StatusCode.ok.rawValue))
            }
            
            it("returns a response with content type of text") {
                let getAction = buildAction()

                let expectResponse = getAction.execute()

                expect(expectResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
        }
    }
}
