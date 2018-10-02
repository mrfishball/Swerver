import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestSpec: QuickSpec {
    
    override func spec() {
        describe("HttpRequest") {
            let httpRequestParser = HttpRequestParser()
            
            it("can equate two request objects") {
                let requestString = "\(RequestMethod.get.rawValue) \(Resource.test.rawValue) \(HttpVersion.current.rawValue)"

                let request = try? httpRequestParser.parse(request: requestString)
                let request2 = try? httpRequestParser.parse(request: requestString)
                expect(request).to(equal(request2))
            }
        }
    }
}
