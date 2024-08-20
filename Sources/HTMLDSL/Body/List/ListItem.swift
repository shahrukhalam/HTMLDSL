struct ListItem: HTMLBodyListItemView {
    let tag: Tag = .enclosing(.listItem)
    let body: String

    var attributes = [Attribute]()

    init(_ text: String) {
        self.body = text
    }
}
