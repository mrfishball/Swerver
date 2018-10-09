public protocol HttpAction {
    func execute() -> HttpResponse
}
