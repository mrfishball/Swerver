import Quick
import Nimble
import Swerver
import Foundation

class OptionsActionSpec: QuickSpec {
    
    override func spec() {
        describe("A OPTIONS action") {
            let routes = Routes()
            guard let route = URL(string: Resource.test_get.rawValue) else {
                    return
            }
            let optionsAction = OptionsAction(routes: routes, route: route)
            let aRoute = Route(url: route, actions: [RequestMethod.options: optionsAction, RequestMethod.get: GetAction()])
            
            routes.addRoute(route: aRoute)
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request with a 200 status code") {
                
                let okResponse = optionsAction.execute()
                expect(okResponse.statusCode).to(equal(StatusCode.ok.rawValue))
            }
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request with a content type of text") {
                
                let okResponse = optionsAction.execute()
                expect(okResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request with all the allowed methods in the allow header") {
                
                let okResponse = optionsAction.execute()
                expect(okResponse.get(header: .allow)).to(equal("GET,OPTIONS"))
            }
        }
    }
}
