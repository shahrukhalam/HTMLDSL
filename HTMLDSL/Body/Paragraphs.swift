//
//  Paragraphs.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Paragraphs: HTMLBodyTextContentView {
    var body: String
    let tag = Tag.enclosing(.paragraph)
    var attributes = [Attribute]()

    let text: String

    init(_ text: String) {
        self.text = text
        self.body = text
    }
}
