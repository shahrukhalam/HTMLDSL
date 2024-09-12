public struct Embed: HTMLBodyContentView {
    public let body: String = .empty
    public let tag = Tag.enclosing(.iframe)
    public var attributes = [Attribute]()

    public init(_ source: String) {
        self.attributes += [
            .source(source),
            .key("frameborder", value: "0")
        ]
    }
}

public struct VideoEmbed: HTMLBodyContentView {
    public let body: String = .empty
    public let tag = Tag.enclosing(.iframe)
    public var attributes = [Attribute]()

    public init(_ source: String) {
        self.attributes += [
            .source(source),
            .key("allow", value: "autoplay; fullscreen; encrypted-media; picture-in-picture"),
            .value("allowfullscreen"),
            .key("frameborder", value: "0")
        ]
    }
}

public struct Video: HTMLBodyContentView {
    public let body: String
    public let tag = Tag.enclosing(.video)
    public var attributes = [Attribute]()

    public init(_ source: String) {
        self.body = "<source src=\"\(source)\">"
        self.attributes += [
            .value("controls")
        ]
    }
}
