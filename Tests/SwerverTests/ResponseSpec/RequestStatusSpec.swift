import Quick
import Nimble
import Swerver
import Foundation

class RequestStatusSpec: QuickSpec {
    override func spec() {
        describe("A RequestStatus enum") {
            context("for successful requests") {
                it("can return a status code of '200'") {
                    expect(RequestStatus.SUCCESS.getStatusCode()).to(equal("200"))
                }

                it("can return a status phrase of 'OK'") {
                    expect(RequestStatus.SUCCESS.getStatusPhrase()).to(equal("OK"))
                }
            }

            context("for unsuccessful requests") {
                it("can return a status code of '501'") {
                    expect(RequestStatus.FAILED.getStatusCode()).to(equal("501"))
                }

                it("can return a status phrase of 'Not Implemented'") {
                    expect(RequestStatus.FAILED.getStatusPhrase()).to(equal("Not Implemented"))
                }
            }
        }
    }
}
