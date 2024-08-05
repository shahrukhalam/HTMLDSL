public struct Embed: HTMLBodyContentView {
    public let body: String = .empty
    public let tag = Tag.enclosing(.iframe)
    public var attributes = [Attribute]()

    public init(_ source: String) {
        self.attributes += [.source(source), .custom(key: "frameborder", value: "0")]
    }
}
