import Quick
import Nimble
import Swerver
import Foundation

class RouteSpec: QuickSpec {

    override func spec() {
        describe("A Route") {
            guard let url = URL(string: Resource.test_get.rawValue) else {
                return
            }
            let aRoute = Route(url: url, actions: [RequestMethod.get:GetAction()])
            
            it("can return a list of methods allowed of the route") {
                expect(aRoute.getListOfMethods()).to(equal(["GET"]))
            }
        }
    }
}
