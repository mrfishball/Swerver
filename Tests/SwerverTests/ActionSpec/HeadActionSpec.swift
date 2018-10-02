import Quick
import Nimble
import Swerver

class HeadActionSpec: QuickSpec {

    override func spec() {
        describe("A HEAD action") {
            let responseBuilder = ResponseBuilder()
            let headAction = HeadAction()

            it("can dispatch to response builder to build a response for a successful HEAD request") {
                let expectResponse = headAction.execute()
                expect(expectResponse.statusCode).to(equal(StatusCode.ok.rawValue))
                expect(expectResponse.statusPhrase).to(equal(StatusCode.ok.getStatusPhrase()))
                expect(expectResponse.contentType).to(equal(ContentType.text.rawValue))
                expect(expectResponse.body.count).to(equal(0))
            }
        }
    }
}
