import Quick
import Nimble
import Swerver
import Foundation

class RoutesSpec: QuickSpec {
    
    override func spec() {
        describe("A Routes") {
            var routes = Routes()
            let targetRoute = URL(string: Resource.test.rawValue)
            let invalidURL = URL(string: String())
            let unknownURL = URL(string: Resource.notThere.rawValue)
            
            it("accept and store new routes") {
                routes.addRoute(url: targetRoute, actions: [RequestMethod.get: GetAction(), RequestMethod.head: HeadAction()])
                expect(routes.routeExist(url: targetRoute)).to(beTrue())
            }
            
            it("can return the total number of routes") {
                expect(routes.numberOfRoutes()).to(equal(1))
            }
            
            it("can return a dictionary of all allowed methods for an existing route with the request method as keys and http action as values") {
                let expectedDictOfMethods = routes.fetchAllActions(url: targetRoute)
                
                expect(expectedDictOfMethods.count).to(equal(2))
                expect(expectedDictOfMethods.keys.contains(RequestMethod.get)).to(beTrue())
                expect(expectedDictOfMethods.keys.contains(RequestMethod.head)).to(beTrue())
                expect(type(of: expectedDictOfMethods[RequestMethod.get])).to(beAKindOf(Optional<HttpAction>.Type.self))
                expect(type(of: expectedDictOfMethods[RequestMethod.head])).to(beAKindOf(Optional<HttpAction>.Type.self))
            }
            
            it("can return a list of all allowed methods for an existing route") {
                let expectedListOfMethods = routes.fetchAllowedMethods(url: targetRoute)
                    
                expect(expectedListOfMethods.count).to(equal(2))
                expect(expectedListOfMethods.contains(RequestMethod.get.rawValue)).to(beTrue())
                expect(expectedListOfMethods.contains(RequestMethod.head.rawValue)).to(beTrue())
            }
            
            context("when trying to add invalid URL") {
                it("will ignore the invalid URL") {
                    routes.addRoute(url: invalidURL, actions: [:])
                    expect(routes.numberOfRoutes()).to(equal(1))
                }
            }
            
            context("when trying to fetch actions for an unknown route") {
                it("will return an empty dictionary") {
                    let allActions = routes.fetchAllActions(url: unknownURL)
                    expect(allActions.count).to(equal(0))
                }
            }
            
            context("when trying to fetch actions for an invalid URL") {
                it("will return an empty dictionary") {
                    let allActions = routes.fetchAllActions(url: invalidURL)
                    expect(allActions.count).to(equal(0))
                }
            }
        }
    }
}
