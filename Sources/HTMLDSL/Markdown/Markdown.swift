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
    public let newLine: NewLine = .one
    public let tag: Tag = .enclosing(.div)
    public var attributes = [Attribute]()
    
    public init(_ markdown: String) {
        self.body = markdown.html
    }
}

private extension String {
    var html: Self {
        guard let cString = cmark_markdown_to_html(self, utf8.count, CMARK_OPT_UNSAFE) else {
            return self
        }

        defer { free(cString) }
        return String(cString: cString)
    }
}
