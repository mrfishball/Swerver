import Quick
import Nimble
import Swerver
import Foundation

class RouteSpec: QuickSpec {
    override func spec() {
        describe("A Route") {
            func buildDefaultResponse() -> HttpResponse {
                return HttpResponseBuilder()
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .build()
            }

            it("returns a list of methods allowed of the route") {
                let route = Route(url: TestData.validUrlOne(),
                                  actions: [RequestMethod.get: buildDefaultResponse()])

                let actualListOfMethods = route.getListOfMethods()

                expect(actualListOfMethods).to(equal(["GET", "OPTIONS"]))
            }

            it("returns available responses for the route") {
                let route = Route(url: TestData.validUrlOne(),
                                  actions: [RequestMethod.get: buildDefaultResponse()])

                route.addAction(method: .head, action: buildDefaultResponse())
                let actualActions = route.getActions()
                let expectedListOfActions = [RequestMethod.get: buildDefaultResponse(),
                                             RequestMethod.head: buildDefaultResponse()]

                expect(actualActions).to(equal(expectedListOfActions))
            }

            context("when compares to another route") {
                it("is true if the url matches") {
                    let routeOne = Route(url: TestData.validUrlOne(),
                                         actions: [RequestMethod.get: buildDefaultResponse()])
                    let routeTwo = Route(url: TestData.validUrlOne(),
                                         actions: [RequestMethod.head: buildDefaultResponse()])
                    
                    expect(routeTwo).to(equal(routeOne))
                }
            }
        }
    }
}
