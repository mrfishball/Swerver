import XCTest
@testable import Swerver

final class SwerverTests: XCTestCase {
    
    let server = EchoServer(port: 1337)
    
    func testPortNumber() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(server.port, 1337)
    }
    
    func testContinueRunning() {
        XCTAssertTrue(server.continueRunning)
    }
    
    


    static var allTests = [
        ("testPortNumber", testPortNumber), ("testContinueRunning", testContinueRunning)
    ]
}
