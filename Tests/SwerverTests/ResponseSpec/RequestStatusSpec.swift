import Quick
import Nimble
import Swerver

class RequestStatusSpec: QuickSpec {
    override func spec() {
        describe("A RequestStatus enum") {
            context("for successful requests") {
                it("can return a status code of '200'") {
                    expect(RequestStatus.success.getStatusCode()).to(equal("200"))
                }

                it("can return a status phrase of 'OK'") {
                    expect(RequestStatus.success.getStatusPhrase()).to(equal("OK"))
                }
            }

            context("for unsuccessful requests") {
                it("can return a status code of '501'") {
                    expect(RequestStatus.failed.getStatusCode()).to(equal("501"))
                }

                it("can return a status phrase of 'Not Implemented'") {
                    expect(RequestStatus.failed.getStatusPhrase()).to(equal("Not Implemented"))
                }
            }
        }
    }
}
