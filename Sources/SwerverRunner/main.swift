import Foundation
import Swerver

let port = 5000

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

let server = Swerver(port: port, router: router)

print("Dummy Server")
print("Connect with a browser by enter the URL 'localhost:\(port)'")
print("Connect with a command line window by entering 'telnet localhost \(port)'")

try server.start()
