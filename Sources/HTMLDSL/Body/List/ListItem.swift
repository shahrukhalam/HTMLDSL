struct ListItem: HTMLBodyListItemView {
    let tag: Tag = .enclosing(.listItem)
    var newLine: NewLine = .none
    let body: String

    var attributes = [Attribute]()

    init(_ text: String) {
        self.body = text
    }
}
