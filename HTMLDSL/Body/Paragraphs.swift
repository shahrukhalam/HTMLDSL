//
//  Paragraphs.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Paragraphs: HTMLBodyContentView {
    typealias Body = Never
    let tag = Tag.enclosing(.paragraph)

    private let text: String

    init(_ text: String) {
        self.text = text
    }

    var element: String {
        "<\(tag.description)> \(text) </\(tag.description)>"
    }
}
