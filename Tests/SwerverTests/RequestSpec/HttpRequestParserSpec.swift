import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestParserSpec: QuickSpec {
    override func spec() {
        describe("An HTTP Request Parser") {
            var httpRequestParser = HttpRequestParser()

            it("returns an HttpRequest Object") {
                let requestData = "\(RequestMethod.get.rawValue) \(Resource.test.rawValue) \(HttpVersion.current.rawValue)"
                let parsedRequest = httpRequestParser.parse(request: requestData)
                expect(parsedRequest.getHttpVersion()).to(equal(HttpVersion.current))
                expect(parsedRequest.getUrl()).to(equal(URL(string: Resource.test.rawValue)))
                expect(parsedRequest.getMethod()).to(equal(RequestMethod.get))
            }
            
//            it("returns an HttpRequest Object") {
//                let requestData = " "
//                let parsedRequest = httpRequestParser.parse(request: requestData)
//                expect(parsedRequest.getHttpVersion()).to(equal(HttpVersion.current))
//                expect(parsedRequest.getUrl()).to(equal(URL(string: Resource.test.rawValue)))
//                expect(parsedRequest.getMethod()).to(equal(RequestMethod.get))
//            }
        }
    }
}
