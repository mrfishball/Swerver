import Quick
import Nimble
import Swerver

class NotAllowedActionSpec: QuickSpec {
    
    override func spec() {
        describe("A Method Not Allowed action") {
            let responseBuilder = ResponseBuilder()
            let notAllowedAction = NotAllowedAction()
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request") {
                let allowedMethods = [RequestMethod.get.rawValue, RequestMethod.options.rawValue]
                notAllowedAction.setAllowedMethods(methods: allowedMethods)
                let okResponse = notAllowedAction.execute()
                expect(okResponse.statusCode).to(equal(StatusCode.notAllowed.rawValue))
                expect(okResponse.statusPhrase).to(equal(StatusCode.notAllowed.getStatusPhrase()))
                expect(okResponse.contentType).to(equal(ContentType.text.rawValue))
                expect(okResponse.allowedMethods).to(equal(allowedMethods))
            }
        }
    }
}