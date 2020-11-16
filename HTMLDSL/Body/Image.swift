//
//  Image.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Image: HTMLBodyContentView {
    typealias Body = Never
    let tag = Tag.selfClosing(.image)
    var attributes = Set<Attribute>()

    private let source: String
    private let alternateText: String

    init(_ source: String, alternateText: String) {
        self.source = source
        self.alternateText = alternateText
    }

    var element: String {
        let allAttributes = " " + attributes.map { $0.description }.joined(separator: " ")
        let finalAttribute = attributes.isEmpty ? "" : allAttributes
        return "<\(tag.description) src=\"\(source)\" alt=\"\(alternateText)\"\(finalAttribute)>"
    }
}
