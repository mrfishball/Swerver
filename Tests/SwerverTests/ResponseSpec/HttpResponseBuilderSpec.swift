import Quick
import Nimble
import Swerver

class HttpResponseBuilderSpec: QuickSpec {
    override func spec() {
        describe("A HTTP Response Builder") {
            func buildBuilder() -> HttpResponseBuilder {
                return HttpResponseBuilder()
            }
            
            it("builds a response object with an 200 status code") {
                let responseBuilder = buildBuilder()
                let response = responseBuilder
                    .with(statusCode: .ok)
                    .build()
                
                expect(response.statusCode).to(equal(StatusCode.ok))
            }
            
            
            it("builds a response object with a content type") {
                let responseBuilder = buildBuilder()
                let response = responseBuilder
                    .with(contentType: .text)
                    .build()

                expect(response.get(header: .contentType)).to(equal(ContentType.text.rawValue))
            }
            
            it("gives a response object a body") {
                let responseBuilder = buildBuilder()
                let response = responseBuilder
                    .with(body: "Hello World!")
                    .build()
                
                expect(response.body).to(equal("Hello World!"))
            }
            
            it("sets the content length according to the length of the body") {
                let responseBuilder = buildBuilder()
                let body = "Hello World!"
                let response = responseBuilder
                    .with(body: body)
                    .build()
                
                expect(response.get(header: .contentLength)).to(equal(String(body.count)))
            }
            
            it("sets the allow header") {
                let responseBuilder = buildBuilder()
                let response = responseBuilder
                    .set(header: .allow, value: "GET, OPTIONS")
                    .build()
                
                expect(response.get(header: .allow)).to(equal("GET, OPTIONS"))
            }
        }
    }
}
