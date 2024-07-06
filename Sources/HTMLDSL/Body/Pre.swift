public struct Pre: HTMLBodyContentView {
    public var body: String

    public let tag: Tag = .enclosing(.pre)
    public var attributes = [Attribute]()

    public init(_ text: String) {
        self.body = text
    }
}
