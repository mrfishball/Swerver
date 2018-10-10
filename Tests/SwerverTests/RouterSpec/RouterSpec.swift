import Quick
import Nimble
import Swerver
import Foundation

class RouterSpec: QuickSpec {
    override func spec() {
        describe("A Router") {
            var router = Router()

            guard let urlOne = URL(string: Resource.test_get.rawValue),
                let urlTwo = URL(string: Resource.test_head.rawValue),
                let urlThree = URL(string: Resource.test_option.rawValue),
                let urlNotFound = URL(string: "/not_here") else {
                return
            }

            context("when receive an invalid request object") {
                let anInvalidRequest: HttpRequest? = nil
                let expectedResponse = router.process(request: anInvalidRequest)
                
                it("returns a response with a 404 status code") {
                    expect(expectedResponse.statusCode).to(equal(StatusCode.not_found.rawValue))
                }
                
                it("returns a response with a content type of text") {
                    expect(expectedResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }
                
                it("returns a response with an empty body") {
                    expect(expectedResponse.get(header: .contentLength)).to(equal("0"))
                }
            }

            context("when receive a GET request for an existing route") {
                let aGetRequest = HttpRequest(method: RequestMethod.get, url: urlOne)
                let expectedResponse = router.process(request: aGetRequest)
                
                it("returns an response with a 200 status code") {
                    expect(expectedResponse.statusCode).to(equal(StatusCode.ok.rawValue))
                }
                
                it("returns an response with a content type of text") {
                    expect(expectedResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }
                
                it("returns an response with an empty body") {
                    expect(expectedResponse.get(header: .contentLength)).to(equal("0"))
                }
            }

            context("when receive a HEAD request for an existing route") {
                let aHeadRequest = HttpRequest(method: RequestMethod.head, url: urlTwo)
                let expectedResponse = router.process(request: aHeadRequest)
                
                it("returns an response with 200 OK status") {
                    expect(expectedResponse.statusCode).to(equal(StatusCode.ok.rawValue))
                }
                
                it("returns an response with a content type of text") {
                    expect(expectedResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }
                
                it("returns an response with an empty body") {
                    expect(expectedResponse.get(header: .contentLength)).to(equal("0"))
                }
            }

            context("when receive a request to an unknown URL") {
                let aRogueRequest = HttpRequest(method: RequestMethod.get, url: urlNotFound)
                let expectedResponse = router.process(request: aRogueRequest)
                it("returns an response of Not Found status with a 404 status code") {
                    expect(expectedResponse.statusCode).to(equal(StatusCode.not_found.rawValue))
                }
                
                it("returns an response of Not Found status with a content type of text") {
                    expect(expectedResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }
                
                it("returns an response of Not Found status with an empty body") {
                    expect(expectedResponse.get(header: .contentLength)).to(equal("0"))
                }
            }

            context("when receive an OPTIONS request to an existing resource") {
                let anOptionsRequest = HttpRequest(method: RequestMethod.options, url: urlThree)
                let expectedResponse = router.process(request: anOptionsRequest)
                
                it("returns an response with a 200 status code") {
                    expect(expectedResponse.statusCode).to(equal(StatusCode.ok.rawValue))
                }
                
                it("returns an response with a content type of text") {
                    expect(expectedResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }
                
                it("returns an response with all the allowed methods for the resource in the allow header") {
                    expect(expectedResponse.get(header: .allow)).to(equal("GET,HEAD,OPTIONS"))
                }
                
                it("returns an response with an empty body") {
                    expect(expectedResponse.get(header: .contentLength)).to(equal("0"))
                }
            }
            
            context("when receive an unknown request to an existing resource") {
                let anUnknownRequest = HttpRequest(method: RequestMethod.options, url: urlTwo)
                let expectedResponse = router.process(request: anUnknownRequest)
                
                it("returns a response with a 405 status code") {
                    expect(expectedResponse.statusCode).to(equal(StatusCode.not_allowed.rawValue))
                }
                
                it("returns an response with a content type of text") {
                    expect(expectedResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }
                
                it("returns an response with all the allowed methods for the resource in the allow header") {
                    expect(expectedResponse.get(header: .allow)).to(equal("HEAD"))
                }
                
                it("returns an response with an empty body") {
                    expect(expectedResponse.get(header: .contentLength)).to(equal("0"))
                }
            }
        }
    }
}
