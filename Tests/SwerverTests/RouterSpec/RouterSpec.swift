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

            func addARoute(method: RequestMethod, router: Router) {
                let targetRoute = TestData.validUrlOne()
                router.addRoute(method: method, url: targetRoute.absoluteString) {
                    return HttpResponseBuilder.buildOK()
                }
            }
            
            context("receives an invalid request object") {
                it("returns a response with a 404 status code") {
                    let router = buildRouter()
                    let anInvalidRequest: HttpRequest? = nil
                    
                    let response = router.process(request: anInvalidRequest)
                    
                    expect(response.statusCode).to(equal(StatusCode.notFound))
                }
                
                it("returns a response with a content type of text") {
                    let router = buildRouter()
                    let anInvalidRequest: HttpRequest? = nil
                    
                    let response = router.process(request: anInvalidRequest)
                    
                    expect(response.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }
            }
            
            context("receives a request to an unknown URL") {
                it("returns a response of Not Found status with a 404 status code") {
                    let router = buildRouter()
                    let aRogueRequest = HttpRequest(method: RequestMethod.get, url: TestData.validUrlOne())
                    
                    let response = router.process(request: aRogueRequest)
                    
                    expect(response.statusCode).to(equal(StatusCode.notFound))
                }

                it("returns a response of Not Found status with a content type of text") {
                    let router = buildRouter()
                    let aRogueRequest = HttpRequest(method: RequestMethod.get, url: TestData.validUrlOne())
                    
                    let response = router.process(request: aRogueRequest)
                    
                    expect(response.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }
            }
            
            context("receives an OPTIONS request to an existing resource") {
                it("returns a response with a 200 status code") {
                    let router = buildRouter()
                    let anOptionsRequest = HttpRequest(method: RequestMethod.options, url: TestData.validUrlOne())

                    addARoute(method: .get, router: router)
                    let response = router.process(request: anOptionsRequest)
                    
                    expect(response.statusCode).to(equal(StatusCode.ok))
                }

                it("returns a response with a content type of text") {
                    let router = buildRouter()
                    let anOptionsRequest = HttpRequest(method: RequestMethod.options, url: TestData.validUrlOne())

                    addARoute(method: .get, router: router)
                    let response = router.process(request: anOptionsRequest)
                    
                    expect(response.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }

                it("returns a response with all the allowed methods for the resource in the allow header") {
                    let router = buildRouter()
                    let anOptionsRequest = HttpRequest(method: RequestMethod.options, url: TestData.validUrlOne())

                    addARoute(method: .get, router: router)
                    addARoute(method: .head, router: router)
                    let response = router.process(request: anOptionsRequest)
                    
                    expect(response.get(header: .allow)).to(equal("GET,HEAD,OPTIONS"))
                }
            }
            
            context("receives an unknown request to an existing resource") {
                it("returns a response with a 405 status code") {
                    let router = buildRouter()
                    let anUnknownRequest = HttpRequest(method: RequestMethod.head, url: TestData.validUrlOne())

                    addARoute(method: .get, router: router)
                    let response = router.process(request: anUnknownRequest)
                    
                    expect(response.statusCode).to(equal(StatusCode.notAllowed))
                }
                
                it("returns a response with a content type of text") {
                    let router = buildRouter()
                    let anUnknownRequest = HttpRequest(method: RequestMethod.head, url: TestData.validUrlOne())

                    addARoute(method: .get, router: router)
                    let response = router.process(request: anUnknownRequest)
                    
                    expect(response.get(header: .contentType)).to(equal(ContentType.text.rawValue))
                }
                
                it("returns a response with all the allowed methods for the resource in the allow header") {
                    let router = buildRouter()
                    let anUnknownRequest = HttpRequest(method: RequestMethod.head, url: TestData.validUrlOne())

                    addARoute(method: .get, router: router)
                    let response = router.process(request: anUnknownRequest)

                    expect(response.get(header: .allow)).to(equal("GET,OPTIONS"))
                }
            }
        }
    }
}
