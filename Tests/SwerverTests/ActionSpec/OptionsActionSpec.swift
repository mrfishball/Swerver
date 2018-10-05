import Quick
import Nimble
import Swerver

class OptionsActionSpec: QuickSpec {
    
    override func spec() {
        describe("A OPTIONS action") {
            let responseBuilder = ResponseBuilder()
            let optionsAction = OptionsAction()
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request") {
                let allowedMethods = [RequestMethod.get.rawValue, RequestMethod.options.rawValue]
                optionsAction.setAllowedMethods(methods: allowedMethods)
                let okResponse = optionsAction.execute()
                expect(okResponse.statusCode).to(equal(StatusCode.ok.rawValue))
                expect(okResponse.statusPhrase).to(equal(StatusCode.ok.getStatusPhrase()))
                expect(okResponse.contentType).to(equal(ContentType.text.rawValue))
                expect(okResponse.allowedMethods).to(equal(allowedMethods))
            }
        }
    }
}
