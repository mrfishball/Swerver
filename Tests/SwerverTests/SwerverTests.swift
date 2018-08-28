import XCTest
import Socket
@testable import Swerver

final class SwerverTests: XCTestCase {
    
    let greeting = SwerverCore()
    
    func testGreeting() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(greeting.greeting(), "Hello World!")
    }


    static var allTests = [
        ("testExample", testGreeting),
    ]
}
