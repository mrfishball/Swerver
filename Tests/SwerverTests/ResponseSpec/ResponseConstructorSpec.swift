import Quick
import Nimble
import Swerver

class ResponseConstructorSpec: QuickSpec {
    override func spec() {
        describe("A ResponseBuilder") {
            var responseBuilder: ResponseConstructor!
            
            beforeEach {
                responseBuilder = ResponseConstructor()
            }
            
            it("can build a 200 OK response") {
                let expectedResponse = HttpResponse(statusCode: RequestStatus.success.getStatusCode(), statusPhrase: RequestStatus.success.getStatusPhrase())
                expect(responseBuilder.generate200OKResponse()).to(equal(expectedResponse))
            }
            
            it("can build a 501 Not Implemented response") {
                let expectedResponse = HttpResponse(statusCode: RequestStatus.failed.getStatusCode(), statusPhrase: RequestStatus.failed.getStatusPhrase())
                expect(responseBuilder.generate501NotImplementedResponse()).to(equal(expectedResponse))
            }
        }
    }
}
