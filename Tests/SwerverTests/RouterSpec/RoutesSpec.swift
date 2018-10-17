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
                return Route(url: TestData.validUrlOne(), actions: [RequestMethod.get: GetAction(), RequestMethod.head: HeadAction()])
            }
            
            it("stores a new route") {
                let routes = buildRoutes()
                let route = buildRoute()
                let targetRoute = TestData.validUrlOne()

                routes.addRoute(route: route)
                let targetRouteExist = routes.routeExist(url: targetRoute)
                
                expect(targetRouteExist).to(beTrue())
            }

            it("returns an existing route") {
                let routes = buildRoutes()
                let route = buildRoute()
                let targetRoute = TestData.validUrlOne()

                routes.addRoute(route: route)
                let actualRoute = routes.fetchRoute(url: targetRoute)
                
                expect(actualRoute?.url).to(equal(targetRoute))
            }
            
            it("returns a list of allowed methods of a route") {
                let routes = buildRoutes()
                let route = buildRoute()
                let targetRoute = TestData.validUrlOne()

                routes.addRoute(route: route)
                let listOfAllowedMethod = routes.allowedMethods(url: targetRoute)
                
                expect(listOfAllowedMethod).to(equal(["GET", "HEAD", "OPTIONS"]))
            }
        }
    }
}
