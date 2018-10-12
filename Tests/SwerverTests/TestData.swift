import Foundation

class TestData {
    static func validUrlOne() -> URL {
        return URL(string: "/")!
    }

    static func validUrlTwo() -> URL {
        return URL(string: "/foo")!
    }
}