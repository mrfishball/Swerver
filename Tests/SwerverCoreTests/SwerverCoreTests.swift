import XCTest

class SwerverCoreTests: XCTestCase {
    
    var newCore:SwerverCore!
    
    override func setUp() {
        super.setUp()
        
        newCore = SwerverCore()
    }
    
    override func tearDown() {
        super.tearDown()
        
        newCore = nil
    }
    
    func testGreeting() {
        
        let message = newCore.greeting()
        XCTAssertEqual(message, "Hello World")
    }
    
}
