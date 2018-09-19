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
                let body = "\(StatusCode.ok.rawValue) \(StatusCode.ok.getStatusPhrase())"
                let expectedResponse = HttpResponse(statusCode: StatusCode.ok.rawValue, statusPhrase: StatusCode.ok.getStatusPhrase(), body: body)
                expect(responseBuilder.generate200OKResponse()).to(equal(expectedResponse))
            }
            
            it("can build a 501 Not Implemented response") {
                let body = "\(StatusCode.not_implemented.rawValue) \(StatusCode.not_implemented.getStatusPhrase())"
                let expectedResponse = HttpResponse(statusCode: StatusCode.not_implemented.rawValue, statusPhrase: StatusCode.not_implemented.getStatusPhrase(), body: body)
                expect(responseBuilder.generate501NotImplementedResponse()).to(equal(expectedResponse))
            }
        }
    }
}
