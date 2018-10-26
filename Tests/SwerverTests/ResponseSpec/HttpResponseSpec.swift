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
            
            func defaultResponseBuilder() -> HttpResponseBuilder {
                return HttpResponseBuilder()
                    .with(statusCode: .ok)
                    .with(contentType: .text)
                    .set(header: .allow, value: "GET")
                    .with(body: "Hello")
            }
            
            context("when compares with another response object") {
                it("is true when attributes match") {
                    let responseOne = defaultResponseBuilder().build()
                    let responseTwo = defaultResponseBuilder().build()
                    
                    expect(responseOne).to(equal(responseTwo))
                }
                
                it("is false when the status code does not match") {
                    let responseOne = defaultResponseBuilder()
                        .with(statusCode: .ok)
                        .build()
                    let responseTwo = defaultResponseBuilder()
                        .with(statusCode: .notFound)
                        .build()
                    
                    expect(responseOne).toNot(equal(responseTwo))
                }
                
                it("is false when the content type does not match") {
                    let responseBuilder = buildBuilder()
                    let responseOne = responseBuilder
                        .with(statusCode: .ok)
                        .set(header: .allow, value: "GET")
                        .with(body: "Hello")
                        .build()
                    let responseTwo = responseBuilder
                        .with(statusCode: .ok)
                        .with(contentType: .text)
                        .set(header: .allow, value: "GET")
                        .with(body: "Hello")
                        .build()
                    
                    expect(responseOne).toNot(equal(responseTwo))
                }
                
                it("is false when the body does not match") {
                    let responseOne = defaultResponseBuilder()
                        .with(body: " ")
                        .build()
                    let responseTwo = defaultResponseBuilder()
                        .with(body: "hello")
                        .build()
                    
                    expect(responseOne).toNot(equal(responseTwo))
                }
                
                it("is false when the allow header does not match") {
                    let responseOne = defaultResponseBuilder()
                        .set(header: .allow, value: "GET")
                        .build()
                    let responseTwo = defaultResponseBuilder()
                        .set(header: .allow, value: "HEAD")
                        .build()
                    
                    expect(responseOne).toNot(equal(responseTwo))
                }
            }
            
            it("retrieves the content type of a response") {
                let response = defaultResponseBuilder().build()

                expect(response.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("retrieves the content lenght of a response") {
                let response = defaultResponseBuilder().build()
                
                expect(response.get(header: .contentLength)).to(equal("5"))
            }
            
            it("retrieves the allow header of a response") {
                let response = defaultResponseBuilder().build()
                
                expect(response.get(header: .allow)).to(equal("GET"))
            }
        }
    }
}
