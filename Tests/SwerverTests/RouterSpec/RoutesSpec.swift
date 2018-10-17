import Quick
import Nimble
import Swerver
import Foundation

class RoutesSpec: QuickSpec {

    override func spec() {
        describe("A Routes") {
            func buildRoutes() -> Routes {
                return Routes()
            }
            
            func buildRoute() -> Route {
                return Route(url: TestData.simpleGetUrl(), actions: [RequestMethod.get: GetAction(), RequestMethod.head: HeadAction()])
            }
            
            it("stores a new route") {
                let routes = buildRoutes()
                let route = buildRoute()
                let targetRoute = TestData.simpleGetUrl()

                routes.addRoute(route: route)
                let targetRouteExist = routes.routeExist(url: targetRoute)
                
                expect(targetRouteExist).to(beTrue())
            }

            it("returns an existing route") {
                let routes = buildRoutes()
                let route = buildRoute()
                let targetRoute = TestData.simpleGetUrl()

                routes.addRoute(route: route)
                let expectedRoute = routes.fetchRoute(url: targetRoute)
                
                expect(expectedRoute?.url).to(equal(targetRoute))
            }
            
            it("returns a list of allowed methods of a route") {
                let routes = buildRoutes()
                let route = buildRoute()
                let targetRoute = TestData.simpleGetUrl()

                routes.addRoute(route: route)
                let listOfAllowedMethod = routes.allowedMethods(url: targetRoute)
                
                expect(listOfAllowedMethod).to(equal(["GET", "HEAD", "OPTIONS"]))
            }
        }
    }
}
