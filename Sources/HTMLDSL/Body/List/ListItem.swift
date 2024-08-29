public struct ListItem: HTMLBodyListItemView {
    public let tag: Tag = .enclosing(.listItem)
    public let body: String

    public var attributes = [Attribute]()

    public init(_ text: String) {
        self.body = text
    }
}
