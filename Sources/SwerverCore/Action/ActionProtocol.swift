public protocol Action {
    func dispatch() -> HttpResponse
}
