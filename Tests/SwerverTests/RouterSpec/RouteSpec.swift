import Quick
import Nimble
import Swerver
import Foundation

class RouteSpec: QuickSpec {
    override func spec() {
        describe("A Route") {
            func buildRoute() -> Route {
                return Route(url: TestData.simpleGetUrl(), actions: [RequestMethod.get:GetAction()])
            }

            it("returns a list of methods allowed of the route") {
                let route = buildRoute()
                
                expect(route.getListOfMethods()).to(equal(["GET", "OPTIONS"]))
            }

            context("adding a new method action pair to an existing route") {
                it("increases the total number of pair") {
                    let route = buildRoute()

                    route.addAction(method: .head, action: HeadAction())
                    let actualListOfActions = route.getActions()

                    expect(actualListOfActions.count).to(equal(2))
                }
            }

            context("when compares to another route") {
                it("is true if the url matches") {
                    let routeOne = Route(url: TestData.simpleGetUrl(), actions: [RequestMethod.get:GetAction()])
                    let routeTwo = Route(url: TestData.simpleGetUrl(), actions: [RequestMethod.head:HeadAction()])
                    
                    expect(routeTwo).to(equal(routeOne))
                }
            }
        }
    }
}
