import XCTest
@testable import Swerver

final class SwerverTests: XCTestCase {
    
    let server = EchoServer(port: 1337)
    
    func testPortNumber() {
        XCTAssertEqual(server.port, 1337)
    }
    
    func testContinueListening() {
        XCTAssertTrue(server.continueListening)
    }

    static var allTests = [
        ("testPortNumber", testPortNumber), ("testContinueListening", testContinueListening)
    ]
}
