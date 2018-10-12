import Quick
import Nimble
import Swerver
import Foundation

class HttpResponseSpec: QuickSpec {
    override func spec() {
        describe("A Reponse object") {
            func buildBuilder() -> HttpResponseBuilder {
                return HttpResponseBuilder()
            }
            
            func defaultResponseBuilder() -> HttpResponse {
                return HttpResponseBuilder()
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .set(header: .allow, value: "GET")
                    .with(body: "Hello")
                    .build()
            }
            
            context("when compares with another response object") {
                it("is true when attributes match") {
                    var responseBuilder = buildBuilder()
                    
                    let responseOne = defaultResponseBuilder()
                    let responseTwo = responseBuilder
                        .with(statusCode: .ok)
                        .with(contentType: .text)
                        .set(header: .allow, value: "GET")
                        .with(body: "Hello")
                        .build()
                    
                    expect(responseOne).to(equal(responseTwo))
                }
                
                it("is false when the status code does not match") {
                    var responseBuilder = buildBuilder()
                    
                    let responseOne = defaultResponseBuilder()
                    let responseTwo = responseBuilder
                        .with(statusCode: .not_found)
                        .with(contentType: .text)
                        .set(header: .allow, value: "GET")
                        .with(body: "Hello")
                        .build()
                    
                    expect(responseOne).toNot(equal(responseTwo))
                }
                
                it("is false when the content type does not match") {
                    var responseBuilder = buildBuilder()
                    
                    let responseOne = defaultResponseBuilder()
                    let responseTwo = responseBuilder
                        .with(statusCode: .ok)
                        .set(header: .allow, value: "GET")
                        .with(body: "Hello")
                        .build()
                    
                    expect(responseOne).toNot(equal(responseTwo))
                }
                
                it("is false when the body does not match") {
                    var responseBuilder = buildBuilder()
                    
                    let responseOne = defaultResponseBuilder()
                    let responseTwo = responseBuilder
                        .with(statusCode: .ok)
                        .with(contentType: .text)
                        .set(header: .allow, value: "GET")
                        .with(body: "hello")
                        .build()
                    
                    expect(responseOne).toNot(equal(responseTwo))
                }
                
                it("is false when the allow header does not match") {
                    var responseBuilder = buildBuilder()
                    
                    let responseOne = defaultResponseBuilder()
                    let responseTwo = responseBuilder
                        .with(statusCode: .ok)
                        .with(contentType: .text)
                        .set(header: .allow, value: "HEAD")
                        .with(body: "Hello")
                        .build()
                    
                    expect(responseOne).toNot(equal(responseTwo))
                }
            }
            
            it("retrieves the content type of a response") {
                let response = defaultResponseBuilder()
                
                let expectedContentType = response.get(header: .contentType)
                
                expect(expectedContentType).to(equal(ContentType.text.rawValue))
            }
            
            it("retrieves the content lenght of a response") {
                let response = defaultResponseBuilder()
                
                let expectedContentLength = response.get(header: .contentLength)
                
                expect(expectedContentLength).to(equal("5"))
            }
            
            it("retrieves the allow header of a response") {
                let response = defaultResponseBuilder()
                
                let expectedAllowHeader = response.get(header: .allow)
                
                expect(expectedAllowHeader).to(equal("GET"))
            }
        }
    }
}
