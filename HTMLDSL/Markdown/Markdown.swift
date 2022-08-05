//
//  Markdown.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 04/08/22.
//

import Foundation

struct Markdown: HTMLBodyContentView {    
    var body: String
    let tag: Tag = .enclosing(.div)
    var attributes = [Attribute]()

    init(_ markdown: String) {
        let spaceCount: Int = Indentation.tab.rawValue
        let spaces = Array(repeating: " ", count: spaceCount).joined(separator: "")
        self.body = markdown
            .split(separator: "\n")
            .map { spaces + $0 }
            .joined(separator: "\n")
    }
}
