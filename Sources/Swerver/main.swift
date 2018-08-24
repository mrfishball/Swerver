import SwerverCore

let tool = SwerverCore()

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
