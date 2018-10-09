import Quick
import Nimble
import Swerver
import Foundation

class RoutesSpec: QuickSpec {
    
    override func spec() {
        describe("A Routes") {
            var routes = Routes()
            guard let targetRoute = URL(string: Resource.test.rawValue) else {
                return
            }
            
            it("accept and store new routes") {
                routes.addRoute(url: targetRoute, actions: [RequestMethod.get: GetAction(), RequestMethod.head: HeadAction()])
                expect(routes.routeExist(url: targetRoute)).to(beTrue())
            }
            
            it("can return an options action object with all the allowed methods for an existing route") {
                let optionsAction = OptionsAction()
                optionsAction.setAllowedMethods(methods: ["GET", "HEAD"])
                
                let expectedOptionsAction = routes.optionsAction(url: targetRoute)

                expect(expectedOptionsAction.dispatch()).to(equal(optionsAction.dispatch()))
            }
            
            it("can return a dictionary of all allowed methods for an existing route") {
                let expectedListOfMethods = routes.fetchAllActions(url: targetRoute)
                let expectedActionType =
                
                expect(expectedListOfMethods.count).to(equal(2))
                expect(expectedListOfMethods.keys.contains(RequestMethod.get)).to(beTrue())
                expect(expectedListOfMethods.keys.contains(RequestMethod.head)).to(beTrue())
            }
        }
    }
}
