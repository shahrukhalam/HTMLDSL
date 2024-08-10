public struct Blockquote: HTMLBodyContentView {
    public let body: String
    public let tag = Tag.enclosing(.blockquote)
    public var attributes = [Attribute]()

    public init(_ quote: String) {
        self.body = quote
    }
}
