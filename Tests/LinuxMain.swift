import XCTest
import Quick

import SwerverTests

XCTMain([HttpRequestParserSpec.self,
         HttpRequestSpec.self,
         HttpResponseSpec.self,
         RouterSpec.self,
         SwerverCoreSpec.self,])