import Quick
import Nimble
import Swerver
import Foundation

class HttpRequestParserSpec: QuickSpec {
    override func spec() {
        describe("An HTTP Request Parser") {
            let httpRequestParser = HttpRequestParser()

            it("can returns an HttpRequest Object for a valid request") {
                let requestData = "\(RequestMethod.get.rawValue) \(Resource.test.rawValue) \(HttpVersion.current.rawValue)"
                
                let parsedRequest = try? httpRequestParser.parse(request: requestData)
                expect(parsedRequest?.getHttpVersion()).to(equal(HttpVersion.current))
                expect(parsedRequest?.getUrl()).to(equal(URL(string: Resource.test.rawValue)))
                expect(parsedRequest?.getMethod()).to(equal(RequestMethod.get))
            }
            
            it("throws a ServerError for an invalid request") {
                let invalidRequestData = "\(RequestMethod.get.rawValue) \(Resource.test.rawValue)"
                
                expect {
                    try httpRequestParser.parse(request: invalidRequestData)
                }.to(throwError(errorType: ServerError.self))
            }
        }
    }
}
