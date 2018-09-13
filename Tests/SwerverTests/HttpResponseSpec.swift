import Quick
import Nimble
import Swerver
import Foundation

class HttpResponseSpec: QuickSpec {
    override func spec() {
        describe("HttpResponse") {
            var httpResponse: HttpResponse!
            
            beforeEach {
                httpResponse = HttpResponse(header: "POST", payload: "Not Implemented")
            }
            
            it("can return a string representation of an http response with header, content type and body") {
                let expectedResponse = """
                    HTTP/1.1 POST
                    Content-Type: text/html
                    
                    Not Implemented
                    """
                expect(httpResponse.toString()).to(equal(expectedResponse))
            }
        }
    }

}
