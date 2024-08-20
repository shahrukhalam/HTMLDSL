struct List<Content>: HTMLBodyListView where Content: HTMLBodyListItemView {
    let type: Types

    let body: Content

    public let newLine: NewLine = .one
    var tag: Tag {
        switch type {
        case .ordered:
            return .enclosing(.orderedList)
        case .unordered:
            return .enclosing(.unorderedList)
        }
    }

    var attributes = [Attribute]()

    init(type: Types, @ViewBuilder content: () -> Content) {
        self.type = type
        self.body = content()
    }

    enum Types {
        case ordered
        case unordered
    }
}
