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
                let defaultResponse = HttpResponseBuilder()
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .build()

                return Route(url: TestData.validUrlOne(), actions: [RequestMethod.get: defaultResponse, RequestMethod.head: defaultResponse])
            }
            
            it("stores a new route") {
                let routes = buildRoutes()
                let route = buildRoute()

                routes.addRoute(route: route)
                let targetRouteExist = routes.routeExist(url: TestData.validUrlOne())
                
                expect(targetRouteExist).to(beTrue())
            }

            context("when fetching a route") {
                it("returns the route if it exist") {
                    let routes = buildRoutes()
                    let route = buildRoute()
                    let targetRoute = TestData.validUrlOne()

                    routes.addRoute(route: route)
                    let actualRoute = routes.fetchRoute(url: targetRoute)

                    expect(actualRoute?.url).to(equal(targetRoute))
                }

                it("returns nil if the route doesn't exist") {
                    let routes = buildRoutes()
                    let route = buildRoute()

                    routes.addRoute(route: route)
                    let routeToTest = routes.fetchRoute(url: TestData.validUrlTwo())

                    expect(routeToTest).to(beNil())
                }
            }
            
            it("returns a list of allowed methods of a route") {
                let routes = buildRoutes()
                let route = buildRoute()

                routes.addRoute(route: route)
                let listOfAllowedMethod = routes.allowedMethods(url: TestData.validUrlOne())
                
                expect(listOfAllowedMethod).to(equal(["GET", "HEAD", "OPTIONS"]))
            }
        }
    }
}
