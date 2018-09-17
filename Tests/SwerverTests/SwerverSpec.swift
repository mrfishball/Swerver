import Quick
import Nimble
import Swerver
import Foundation

class SwerverCoreSpec: QuickSpec {
    override func spec() {
        describe("An HTTP server") {
            let server = Swerver(port: 5050)

        }
    }
}
