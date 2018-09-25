import XCTest
import Quick

@testable import SwerverTests

QCKMain([
    HttpRequestSpec.self,
    HttpRequestParserSpec.self,
    HttpResponseSpec.self,
    ResponseBuilderSpec.self,
    ResponseFormatterSpec.self,
    StatusCodeSpec.self,
    RouterSpec.self,
    GetActionSpec.self,
    HeadActionSpec.self,
    NotFoundActionSpec.self,
    OptionsActionSpec.self,
])