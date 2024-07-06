public struct Code: HTMLBodyContentView {
    public var body: String

    public let tag: Tag = .enclosing(.code)
    public var attributes = [Attribute]()

    public init(_ code: String) {
        self.body = code
    }
}
