import Quick
import Nimble
import Swerver
import Foundation

class RouteSpec: QuickSpec {

    override func spec() {
        describe("A Route") {
            
            it("returns a list of methods allowed of the route") {
                let route = Route(url: TestData.simpleGetUrl(), actions: [RequestMethod.get:GetAction()])
                
                expect(route.getListOfMethods()).to(equal(["GET", "OPTIONS"]))
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
