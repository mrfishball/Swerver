import Quick
import Nimble
import Swerver

class NotAllowedActionSpec: QuickSpec {
    
    override func spec() {
        describe("A Method Not Allowed action") {
            let responseBuilder = ResponseBuilder()
            let notAllowedAction = NotAllowedAction()
            
            it("can execute to response builder to build a response for a successful OPTIONS request") {
                let allowedMethods = [RequestMethod.get.rawValue, RequestMethod.options.rawValue]
                notAllowedAction.setAllowedMethods(methods: allowedMethods)
                let okResponse = notAllowedAction.execute()
                expect(okResponse.statusCode).to(equal(StatusCode.not_allowed.rawValue))
                expect(okResponse.statusPhrase).to(equal(StatusCode.not_allowed.getStatusPhrase()))
                expect(okResponse.contentType).to(equal(ContentType.text.rawValue))
                expect(okResponse.allowedMethods).to(equal(allowedMethods))
            }
        }
    }
}
