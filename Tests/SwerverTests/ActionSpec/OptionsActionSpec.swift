import Quick
import Nimble
import Swerver

class OptionsActionSpec: QuickSpec {
    
    override func spec() {
        describe("A OPTIONS action") {
            let responseBuilder = ResponseBuilder()
            let optionsAction = OptionsAction()
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request") {
                let allowedMethods = ["GET"]
                let okResponse = responseBuilder
                    .withStatusCode(statusCode: StatusCode.ok.rawValue)
                    .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                    .withContentType(contentType: ContentType.text.rawValue)
                    .withAllowedMethods(allowedMethods: allowedMethods)
                    .build()
                optionsAction.setAllowedMethods(methods: allowedMethods)
                expect(optionsAction.dispatch()).to(equal(okResponse))
            }
        }
    }
}
