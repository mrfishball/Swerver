import Swerver

let port = 5000

let router = Router()

router.addRoute(method: .get, url: "/simple_get") {
    return GetAction()
}

router.addRoute(method: .head, url: "/simple_get") {
    return HeadAction()
}

router.addRoute(method: .head, url: "/get_with_body") {
    return HeadAction()
}

router.addRoute(method: .get, url: "/method_options") {
    return GetAction()
}

router.addRoute(method: .head, url: "/method_options") {
    return HeadAction()
}

router.addRoute(method: .get, url: "/method_options2") {
    return GetAction()
}

router.addRoute(method: .head, url: "/method_options2") {
    return HeadAction()
}

let server = Swerver(port: port, router: router)

print("Dummy Server")
print("Connect with a browser by enter the URL 'localhost:\(port)'")
print("Connect with a command line window by entering 'telnet localhost \(port)'")

try server.start()
