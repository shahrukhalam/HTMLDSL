//
//  Paragraphs.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Paragraphs: HTMLBodyTextContentView {
    typealias Body = Never
    let tag = Tag.enclosing(.paragraph)
    var attributes = [Attribute]()

    private let text: String

    init(_ text: String) {
        self.text = text
    }

    var element: String {
        let allAttributes = " " + attributes.map { $0.description }.joined(separator: " ")
        let finalAttribute = attributes.isEmpty ? "" : allAttributes
        return "<\(tag.description)\(finalAttribute)> \(text) </\(tag.description)>"
    }
}
