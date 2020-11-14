//
//  Text.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

enum HeadingTag: String {
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
}

struct Headings: HTMLBodyContentView {
    typealias Body = Never
    let tag: Tag

    private let text: String

    init(_ text: String, type: HeadingTag = .h1) {
        self.text = text
        self.tag = Tag.enclosing(.headings(type))
    }

    var element: String {
        "<\(tag.description)> \(text) </\(tag.description)>"
    }
}
