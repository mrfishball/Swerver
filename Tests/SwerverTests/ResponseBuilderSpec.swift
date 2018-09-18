import Quick
import Nimble
import Swerver
import Foundation

class ResponseBuilderSpec: QuickSpec {
    override func spec() {
        describe("A ResponseBuilder") {
            var responseBuilder: ResponseConstructor!
            
            beforeEach {
                responseBuilder = ResponseConstructor()
            }
            
            it("can build a 200 OK response") {
                let expectedResponse = HttpResponse(statusCode: RequestStatus.SUCCESS.getStatusCode(), statusPhrase: RequestStatus.SUCCESS.getStatusPhrase())
                expect(responseBuilder.generate200OKResponse()).to(equal(expectedResponse))
            }
            
            it("can build a 501 Not Implemented response") {
                let expectedResponse = HttpResponse(statusCode: RequestStatus.FAILED.getStatusCode(), statusPhrase: RequestStatus.FAILED.getStatusPhrase())
                expect(responseBuilder.generate501NotImplementedResponse()).to(equal(expectedResponse))
            }
        }
    }
}
