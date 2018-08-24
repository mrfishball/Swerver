import XCTest
@testable import Swerver

final class SwerverTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Swerver().text, "Hello, World!!!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
