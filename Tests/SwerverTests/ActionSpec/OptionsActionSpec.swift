import Quick
import Nimble
import Swerver
import Foundation

class OptionsActionSpec: QuickSpec {
    
    override func spec() {
        describe("A OPTIONS action") {
            let routes = Routes()
            let route = URL(string: Resource.test.rawValue)
            let optionsAction = OptionsAction(routes: routes, route: route!)
            routes.addRoute(url: route!, actions: [RequestMethod.options: optionsAction, RequestMethod.get: GetAction()])
            
            it("can dispatch to response builder to build a response for a successful OPTIONS request") {
                
                let okResponse = optionsAction.execute()
                expect(okResponse.statusCode).to(equal(StatusCode.ok.rawValue))
                expect(okResponse.headers[.contentType]).to(equal(ContentType.text.rawValue))
                expect(okResponse.headers[.allow]).to(equal("\(RequestMethod.get.rawValue), \(RequestMethod.options.rawValue)"))
            }
        }
    }
}
