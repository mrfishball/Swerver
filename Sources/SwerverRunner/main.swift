import Foundation
import Swerver

let router = Router()

router.addRoute(method: .get, url: "/simple_get") {
    return HttpResponseBuilder.buildOK()
}

router.addRoute(method: .head, url: "/simple_get") {
    return HttpResponseBuilder.buildOK()
}

router.addRoute(method: .head, url: "/get_with_body") {
    return HttpResponseBuilder.buildOK()
}

router.addRoute(method: .get, url: "/method_options") {
    return HttpResponseBuilder.buildOK()
}

router.addRoute(method: .head, url: "/method_options") {
    return HttpResponseBuilder.buildOK()
}

router.addRoute(method: .get, url: "/method_options2") {
    return HttpResponseBuilder.buildOK()
}

router.addRoute(method: .head, url: "/method_options2") {
    return HttpResponseBuilder.buildOK()
}

router.addRoute(method: .get, url: "/redirect") {
    return HttpResponseBuilder()
        .with(statusCode: .moved)
        .set(header: .location, value: "/simple_get")
        .build()
}

private func runSwerver(port: Int) throws {
    let httpResponseFormatter = HttpResponseFormatter()
    let httpRequestParser = HttpRequestParser()
    let httpConnection = HttpConnection(router: router,
                                        httpResponseFormatter: httpResponseFormatter,
                                        httpRequestParser: httpRequestParser)

    let server = Swerver(port: port, httpConnection: httpConnection)

    try server.start()
}

try runSwerver(port: 5000)
