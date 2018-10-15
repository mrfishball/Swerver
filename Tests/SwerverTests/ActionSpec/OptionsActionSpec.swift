import Quick
import Nimble
import Swerver
import Foundation

class OptionsActionSpec: QuickSpec {
    
    override func spec() {
        describe("A OPTIONS action") {
            var optionsAction: OptionsAction!

            beforeEach() {
                let routes = Routes()
                guard let route = URL(string: Resource.test_get.rawValue) else {
                    return
                }
                optionsAction = OptionsAction(routes: routes, route: route)
                let aRoute = Route(url: route, actions: [
                    RequestMethod.options: optionsAction,
                    RequestMethod.get: GetAction()
                ])
                routes.addRoute(route: aRoute)
            }

            it("returns a response with status code of 200") {
                let okResponse = optionsAction.execute()

                expect(okResponse.statusCode).to(equal(StatusCode.ok.rawValue))
            }
            
            it("returns a response with content type text") {
                let okResponse = optionsAction.execute()

                expect(okResponse.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("returns a response with the correct 'Allow' header") {
                let okResponse = optionsAction.execute()

                expect(okResponse.get(header: .allow)).to(equal("GET,OPTIONS"))
            }
        }
    }
}
