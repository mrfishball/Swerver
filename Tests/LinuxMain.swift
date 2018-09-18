import XCTest
import Quick

@testable import SwerverTests

QCKMain([
    HttpResponseSpec.self,
    HttpRequestSpec.self,
    HttpRequestParserSpec.self,
    RequestStatusSpec.self,
    ResponseConstructorSpec.self,
    RouterSpec.self
])