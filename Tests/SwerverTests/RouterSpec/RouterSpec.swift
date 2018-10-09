import Quick
import Nimble
import Swerver
import Foundation

class RouterSpec: QuickSpec {
    override func spec() {
        describe("A Router") {
            var router = Router()
            var responseBuilder = ResponseBuilder()

            guard let url = URL(string: Resource.test.rawValue),
                let urlNotFound = URL(string: "/not_here") else {
                return
            }

            context("when receive an invalid request object") {
                it("returns a 404 not found response") {
                    let anInvalidRequest: HttpRequest? = nil
                    let expectedResponse = responseBuilder
                                            .withStatusCode(statusCode: .not_found)
                                            .withContentType(contentType: .text)
                                            .build()
                    expect(router.process(request: anInvalidRequest)).to(equal(expectedResponse))
                }
            }

            context("when receive a GET request for an existing route") {
                it("returns an response with 200 OK status") {
                    let aGetRequest = HttpRequest(method: RequestMethod.get, url: url)
                    let expectedResponse = responseBuilder
                                            .withStatusCode(statusCode: .ok)
                                            .withContentType(contentType: .text)
                                            .build()
                    expect(router.process(request: aGetRequest)).to(equal(expectedResponse))
                }
            }

            context("when receive a HEAD request for an existing route") {
                it("returns an response with 200 OK status") {
                    let aHeadRequest = HttpRequest(method: RequestMethod.head, url: url)
                    let expectedResponse = responseBuilder
                                            .withStatusCode(statusCode: .ok)
                                            .withContentType(contentType: .text)
                                            .build()
                    expect(router.process(request: aHeadRequest)).to(equal(expectedResponse))
                }
            }

            context("when receive a request to an unknown URL") {
                it("returns an response of 404 Not Found status") {
                    let aRogueRequest = HttpRequest(method: RequestMethod.other, url: urlNotFound)
                    let expectedResponse = responseBuilder
                        .withStatusCode(statusCode: .not_found)
                        .withContentType(contentType: .text)
                        .build()
                    expect(router.process(request: aRogueRequest)).to(equal(expectedResponse))
                }
            }

            context("when receive an OPTIONS request to an existing resource") {
                it("returns an response with all the allowed methods of that resource") {
                    let anOptionsRequest = HttpRequest(method: RequestMethod.options, url: url)
                    let expectedResponse = responseBuilder
                        .withStatusCode(statusCode: .ok)
                        .withContentType(contentType: .text)
                        .setHeader(header: .allow, value: "GET, HEAD, OPTIONS")
                        .build()
                    expect(router.process(request: anOptionsRequest)).to(equal(expectedResponse))
                }
            }
        }
    }
}
