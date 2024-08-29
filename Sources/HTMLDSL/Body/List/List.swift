public struct List<Content>: HTMLBodyListView where Content: HTMLBodyListItemView {
    private let type: Types

    public let body: Content
    public let newLine: NewLine = .one
    
    public var tag: Tag {
        switch type {
        case .ordered:
            return .enclosing(.orderedList)
        case .unordered:
            return .enclosing(.unorderedList)
        }
    }

    public var attributes = [Attribute]()

    public init(type: Types, @ViewBuilder content: () -> Content) {
        self.type = type
        self.body = content()
    }

    public enum Types {
        case ordered
        case unordered
    }
}
