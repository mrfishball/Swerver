import Quick
import Nimble
import Swerver

class GetActionSpec: QuickSpec {

    override func spec() {
        describe("A GET action") {
            let getAction = GetAction()

            it("can dispatch to response builder to build a response for a successful GET request with a 200 status code") {
                let expectResponse = getAction.execute()
                expect(expectResponse.statusCode).to(equal(StatusCode.ok.rawValue))

            }
            
            it("can dispatch to response builder to build a response for a successful GET request with a content type of text") {
                let expectResponse = getAction.execute()
                expect(expectResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("can dispatch to response builder to build a response for a successful GET request with an empty body") {
                let expectResponse = getAction.execute()
                expect(expectResponse.body.count).to(equal(0))
            }
        }
    }
}
