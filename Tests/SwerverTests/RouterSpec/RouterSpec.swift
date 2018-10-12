import Quick
import Nimble
import Swerver
import Foundation

class RouterSpec: QuickSpec {
    override func spec() {
        describe("A Router") {
            func buildRouter() -> Router {
                return Router()
            }
            
            context("receives an invalid request object") {
                it("returns a response with a 404 status code") {
                    let router = buildRouter()
                    let anInvalidRequest: HttpRequest? = nil
                    
                    let response = router.process(request: anInvalidRequest)
                    let expectedStatusCode = response.statusCode
                    
                    expect(expectedStatusCode).to(equal(StatusCode.not_found.rawValue))
                }
                
                it("returns a response with a content type of text") {
                    let router = buildRouter()
                    let anInvalidRequest: HttpRequest? = nil
                    
                    let response = router.process(request: anInvalidRequest)
                    let expectedContentType = response.get(header: .contentType)
                    
                    expect(expectedContentType).to(equal(ContentType.text.rawValue))
                }
            }
            
            context("receives a GET request for an existing route") {
                it("returns an response with a 200 status code") {
                    let router = buildRouter()
                    let targetRoute = TestData.simpleGetUrl()
                    let aGetRequest = HttpRequest(method: RequestMethod.get, url: targetRoute)
                    
                    router.addRoute(method: .get, url: targetRoute.absoluteString) {
                        return GetAction()
                    }
                    
                    let response = router.process(request: aGetRequest)
                    let expectedStatusCode = response.statusCode
                    
                    expect(expectedStatusCode).to(equal(StatusCode.ok.rawValue))
                }
                
                it("returns an response with a content type of text") {
                    let router = buildRouter()
                    let targetRoute = TestData.simpleGetUrl()
                    let aGetRequest = HttpRequest(method: RequestMethod.get, url: targetRoute)
                    
                    router.addRoute(method: .get, url: targetRoute.absoluteString) {
                        return GetAction()
                    }
                    
                    let response = router.process(request: aGetRequest)
                    let expectedContentType = response.get(header: .contentType)
                    
                    expect(expectedContentType).to(equal(ContentType.text.rawValue))
                }
            }
            
            context("receives a HEAD request for an existing route") {
                it("returns an response with 200 OK status") {
                    let router = buildRouter()
                    let targetRoute = TestData.getWithBodyUrl()
                    let aHeadRequest = HttpRequest(method: RequestMethod.head, url: targetRoute)
                    
                    router.addRoute(method: .head, url: targetRoute.absoluteString) {
                        return HeadAction()
                    }
                    
                    let response = router.process(request: aHeadRequest)
                    let expectStatusCode = response.statusCode
                    
                    expect(expectStatusCode).to(equal(StatusCode.ok.rawValue))
                }
                
                it("returns an response with a content type of text") {
                    let router = buildRouter()
                    let targetRoute = TestData.getWithBodyUrl()
                    let aHeadRequest = HttpRequest(method: RequestMethod.head, url: targetRoute)
                    
                    router.addRoute(method: .head, url: targetRoute.absoluteString) {
                        return HeadAction()
                    }
                    
                    let response = router.process(request: aHeadRequest)
                    let expectContentType = response.get(header: .contentType)
                    
                    expect(expectContentType).to(equal(ContentType.text.rawValue))
                }
            }
            
            context("receives a request to an unknown URL") {
                it("returns an response of Not Found status with a 404 status code") {
                    let router = buildRouter()
                    let aRogueRequest = HttpRequest(method: RequestMethod.get, url: TestData.notFoundUrl())
                    
                    let response = router.process(request: aRogueRequest)
                    let expectedStatusCode = response.statusCode
                    
                    expect(expectedStatusCode).to(equal(StatusCode.not_found.rawValue))
                }
                
                it("returns an response of Not Found status with a content type of text") {
                    let router = buildRouter()
                    let aRogueRequest = HttpRequest(method: RequestMethod.get, url: TestData.notFoundUrl())
                    
                    let response = router.process(request: aRogueRequest)
                    let expectedContentType = response.get(header: .contentType)
                    
                    expect(expectedContentType).to(equal(ContentType.text.rawValue))
                }
            }
            
            context("receives an OPTIONS request to an existing resource") {
                it("returns an response with a 200 status code") {
                    let router = buildRouter()
                    let targetRoute = TestData.methodOptionsUrl()
                    let anOptionsRequest = HttpRequest(method: RequestMethod.options, url: targetRoute)
                    
                    router.addRoute(method: .get, url: targetRoute.absoluteString) {
                        return GetAction()
                    }
                    
                    let response = router.process(request: anOptionsRequest)
                    let expectedStatusCode = response.statusCode
                    
                    expect(expectedStatusCode).to(equal(StatusCode.ok.rawValue))
                }
                
                it("returns an response with a content type of text") {
                    let router = buildRouter()
                    let targetRoute = TestData.methodOptionsUrl()
                    let anOptionsRequest = HttpRequest(method: RequestMethod.options, url: targetRoute)
                    
                    router.addRoute(method: .get, url: targetRoute.absoluteString) {
                        return GetAction()
                    }
                    
                    let response = router.process(request: anOptionsRequest)
                    let expectedContentType = response.get(header: .contentType)
                    
                    expect(expectedContentType).to(equal(ContentType.text.rawValue))
                }
                
                it("returns an response with all the allowed methods for the resource in the allow header") {
                    let router = buildRouter()
                    let targetRoute = TestData.methodOptionsUrl()
                    let anOptionsRequest = HttpRequest(method: RequestMethod.options, url: targetRoute)
                    
                    router.addRoute(method: .get, url: targetRoute.absoluteString) {
                        return GetAction()
                    }
                    router.addRoute(method: .head, url: targetRoute.absoluteString) {
                        return HeadAction()
                    }
                    
                    let response = router.process(request: anOptionsRequest)
                    let expectedAllowHeader = response.get(header: .allow)
                    
                    expect(expectedAllowHeader).to(equal("GET,HEAD,OPTIONS"))
                }
            }
            
            context("receives an unknown request to an existing resource") {
                it("returns a response with a 405 status code") {
                    let router = buildRouter()
                    let targetRoute = TestData.methodOptionsUrl()
                    let anUnknownRequest = HttpRequest(method: RequestMethod.head, url: targetRoute)
                    
                    router.addRoute(method: .get, url: targetRoute.absoluteString) {
                        return GetAction()
                    }
                    
                    let response = router.process(request: anUnknownRequest)
                    let expectedStatusCode = response.statusCode
                    
                    expect(expectedStatusCode).to(equal(StatusCode.not_allowed.rawValue))
                }
                
                it("returns an response with a content type of text") {
                    let router = buildRouter()
                    let targetRoute = TestData.methodOptionsUrl()
                    let anUnknownRequest = HttpRequest(method: RequestMethod.head, url: targetRoute)
                    
                    router.addRoute(method: .get, url: targetRoute.absoluteString) {
                        return GetAction()
                    }
                    
                    let response = router.process(request: anUnknownRequest)
                    let expectedContentType = response.get(header: .contentType)
                    
                    expect(expectedContentType).to(equal(ContentType.text.rawValue))
                }
                
                it("returns an response with all the allowed methods for the resource in the allow header") {
                    let router = buildRouter()
                    let targetRoute = TestData.methodOptionsUrl()
                    let anUnknownRequest = HttpRequest(method: RequestMethod.head, url: targetRoute)
                    
                    router.addRoute(method: .get, url: targetRoute.absoluteString) {
                        return GetAction()
                    }
                    
                    let response = router.process(request: anUnknownRequest)
                    let expectedAllowHeader = response.get(header: .allow)
                    
                    expect(expectedAllowHeader).to(equal("GET,OPTIONS"))
                }
            }
        }
    }
}
