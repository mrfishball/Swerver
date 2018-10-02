import Quick
import Nimble
import Swerver
import Foundation

class RouterSpec: QuickSpec {
    override func spec() {
        describe("A Router") {
            var router = Router()
            var formatter = ResponseFormatter()
            var responseBuilder = ResponseBuilder()
            var httpRequestParser = HttpRequestParser()

            context("when receive a GET request for an existing route") {
                it("returns an response with 200 OK status") {
                    
                    let requestString = "\(RequestMethod.get.rawValue) \(Resource.test.rawValue) \(HttpVersion.current.rawValue)"
                    
                    let aGetRequest = try? httpRequestParser.parse(request: requestString)
                    let expectedResponse = responseBuilder
                                                .withStatusCode(statusCode: StatusCode.ok.rawValue)
                                                .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                                .withContentType(contentType: ContentType.text.rawValue)
                                                .build()
                    
                    expect(router.process(request: aGetRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }

            context("when receive a HEAD request for an existing route") {
                it("returns an response with 200 OK status") {
                    
                    let requestString = "\(RequestMethod.head.rawValue) \(Resource.test.rawValue) \(HttpVersion.current.rawValue)"
                    
                    let aHeadRequest = try? httpRequestParser.parse(request: requestString)
                    let expectedResponse = responseBuilder
                                                .withStatusCode(statusCode: StatusCode.ok.rawValue)
                                                .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                                .withContentType(contentType: ContentType.text.rawValue)
                                                .build()
                    
                    expect(router.process(request: aHeadRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }

            context("when receive a request to an unknown URL") {
                it("returns a response of 404 Not Found status") {
                    
                    let requestString = "\(RequestMethod.get.rawValue) \(Resource.notThere.rawValue) \(HttpVersion.current.rawValue)"
                    
                    let aRogueRequest = try? httpRequestParser.parse(request: requestString)
                    let expectedResponse = responseBuilder
                                                .withStatusCode(statusCode: StatusCode.notFound.rawValue)
                                                .withStatusPhrase(statusPhrase: StatusCode.notFound.getStatusPhrase())
                                                .withContentType(contentType: ContentType.text.rawValue)
                                                .build()
                    expect(router.process(request: aRogueRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }

            context("when receive an OPTIONS request to an existing resource") {
                it("returns a 200 OK response with all the allowed methods of that resource") {
                    
                    let requestString = "\(RequestMethod.options.rawValue) \(Resource.test.rawValue) \(HttpVersion.current.rawValue)"
                    
                    let anOptionsRequest = try? httpRequestParser.parse(request: requestString)
                    let expectedResponse = responseBuilder
                                                .withStatusCode(statusCode: StatusCode.ok.rawValue)
                                                .withStatusPhrase(statusPhrase: StatusCode.ok.getStatusPhrase())
                                                .withContentType(contentType: ContentType.text.rawValue)
                                                .withAllowedMethods(allowedMethods: ["HEAD", "GET"])
                                                .build()
                    
                    expect(router.process(request: anOptionsRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }

            context("when receive a unknown request to an existing resource") {
                it("returns a 405 Method Not Allowed response with all the allowed methods of that resource") {
                    
                    let requestString = "\(RequestMethod.invalid.rawValue) \(Resource.test.rawValue) \(HttpVersion.current.rawValue)"
                    
                    let anUnknownRequest = try? httpRequestParser.parse(request: requestString)
                    let expectedResponse = responseBuilder
                                                .withStatusCode(statusCode: StatusCode.notAllowed.rawValue)
                                                .withStatusPhrase(statusPhrase: StatusCode.notAllowed.getStatusPhrase())
                                                .withContentType(contentType: ContentType.text.rawValue)
                                                .withAllowedMethods(allowedMethods: ["HEAD", "GET"])
                                                .build()
                    
                    expect(router.process(request: anUnknownRequest)).to(equal(formatter.format(httpResponse: expectedResponse)))
                }
            }
        }
    }
}
