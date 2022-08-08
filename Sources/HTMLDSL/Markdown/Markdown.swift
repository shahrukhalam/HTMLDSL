//
//  Markdown.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 04/08/22.
//

import Foundation
import Ccmark

struct Markdown: HTMLBodyContentView {    
    var body: String
    let tag: Tag = .enclosing(.div)
    var attributes = [Attribute]()
    
    init(_ markdown: String) {
        let spaceCount: Int = Indentation.tab.rawValue
        let spaces = Array(repeating: " ", count: spaceCount).joined(separator: "")
        self.body = Self.html(from: markdown)
            .split(separator: "\n")
            .map { spaces + $0 }
            .joined(separator: "\n")
    }
}

private extension Markdown {
    static func html(from markdown: String, options: Int32 = 0) -> String {
        guard let cString = cmark_markdown_to_html(markdown,
                                                   markdown.utf8.count,
                                                   CMARK_OPT_SMART | options) else {
            return markdown
        }

        defer { free(cString) }
        return String(cString: cString)
    }
}
