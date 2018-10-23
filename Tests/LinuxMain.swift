import XCTest
import Quick

@testable import SwerverTests

QCKMain([
    NotAllowedActionSpec.self,
    NotFoundActionSpec.self,
    OptionsActionSpec.self,

    HttpRequestSpec.self,
    HttpRequestParserSpec.self,

    HttpResponseSpec.self,
    HttpResponseBuilderSpec.self,
    HttpResponseFormatterSpec.self,
    StatusCodeSpec.self,

    RouterSpec.self,
    RouteSpec.self,
    RoutesSpec.self,
])
