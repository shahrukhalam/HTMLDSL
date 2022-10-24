//
//  Markdown.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 04/08/22.
//

import Foundation
import cmark

public struct Markdown: HTMLBodyContentView {
    public var body: String
    public let tag: Tag = .enclosing(.div)
    public var attributes = [Attribute]()
    
    public init(_ markdown: String) {
        let spaceCount: Int = Indentation.tab.rawValue
        let spaces = Array(repeating: " ", count: spaceCount).joined(separator: "")
        self.body = Self.html(from: markdown)
            .split(separator: "\n")
            .map { spaces + $0 }
            .joined(separator: "\n")
    }
}

private extension Markdown {
    static func html(from markdown: String) -> String {
        guard let cString = cmark_markdown_to_html(markdown, markdown.utf8.count, CMARK_OPT_UNSAFE) else {
            return markdown
        }

        defer { free(cString) }
        return String(cString: cString)
    }
}
