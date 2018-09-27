public protocol HttpAction {
    func dispatch() -> HttpResponse
}
