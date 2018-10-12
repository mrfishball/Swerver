import Quick
import Nimble
import Swerver
import Foundation

class RoutesSpec: QuickSpec {

    override func spec() {
        describe("A Routes") {
            var routes = Routes()
            guard let targetRoute = URL(string: Resource.test_get.rawValue) else {
                return
            }
            
            let aRoute = Route(url: targetRoute, actions: [RequestMethod.get: GetAction(), RequestMethod.head: HeadAction()])
            
            it("add and store a new route") {
                routes.addRoute(route: aRoute)
                expect(routes.routeExist(url: targetRoute)).to(beTrue())
            }

            it("can return an existing route") {
                let expectedRoute = routes.fetchRoute(url: targetRoute)
                expect(expectedRoute?.url).to(equal(targetRoute))
            }
            
            it("can return a list of allowed methods of a resource") {
                expect(routes.allowedMethods(url: targetRoute)).to(equal(["GET", "HEAD", "OPTIONS"]))
            }
        }
    }
}
