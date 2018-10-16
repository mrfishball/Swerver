import Swerver
import Foundation

class TestData {
    static func validUrlOne() -> URL {
        return URL(string: "/")!
    }
    
    static func validUrlTwo() -> URL {
        return URL(string: "/foo")!
    }

    static func redirectURL() -> URL {
        return URL(string: Resource.test_redirect.rawValue)!
    }

    static func simpleGetUrl() -> URL {
        return URL(string: Resource.test_get.rawValue)!
    }
    
    static func getWithBodyUrl() -> URL {
        return URL(string: Resource.test_head.rawValue)!
    }
    
    static func methodOptionsUrl() -> URL {
        return URL(string: Resource.test_option.rawValue)!
    }
    
    static func notFoundUrl() -> URL {
        return URL(string: "/not_here")!
    }
}
