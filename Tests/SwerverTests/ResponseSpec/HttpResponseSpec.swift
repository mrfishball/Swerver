import Quick
import Nimble
import Swerver
import Foundation

class HttpResponseSpec: QuickSpec {
    override func spec() {
        describe("HttpResponse") {
            var httpResponse: HttpResponse!
            
            beforeEach {
                httpResponse = HttpResponse(statusCode: StatusCode.ok.rawValue, statusPhrase: StatusCode.ok.getStatusPhrase(), body: String())
            }
            
            it("can equate two response object") {
                let httpResponse2 = HttpResponse(statusCode: StatusCode.ok.rawValue, statusPhrase: StatusCode.ok.getStatusPhrase(), body: String())
                expect(httpResponse).to(equal(httpResponse2))
            }
        }
    }
}
