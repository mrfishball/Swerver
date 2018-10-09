import Quick
import Nimble
import Swerver

class GetActionSpec: QuickSpec {

    override func spec() {
        describe("A GET action") {
            let getAction = GetAction()

            it("can dispatch to response builder to build a response for a successful GET request") {
                let expectResponse = getAction.execute()
                expect(expectResponse.statusCode).to(equal(StatusCode.ok.rawValue))
                expect(expectResponse.headers[.contentType]).to(equal(ContentType.text.rawValue))
                expect(expectResponse.body.count).to(equal(0))
            }
        }
    }
}
