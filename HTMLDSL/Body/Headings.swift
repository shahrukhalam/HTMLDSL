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

struct Headings: HTMLBodyTextContentView {
    typealias Body = Never
    let tag: Tag

    private let text: String
    var attributes = [Attribute]()

    init(_ text: String, type: HeadingTag = .h1) {
        self.text = text
        self.tag = Tag.enclosing(.headings(type))
    }

    var element: String {
        let allAttributes = " " + attributes.map { $0.description }.joined(separator: " ")
        let finalAttribute = attributes.isEmpty ? "" : allAttributes
        return "<\(tag.description)\(finalAttribute)> \(text) </\(tag.description)>"
    }
}
