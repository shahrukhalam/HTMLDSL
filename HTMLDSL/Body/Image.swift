//
//  Image.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Image: HTMLBodyImageContentView {
    typealias Body = Never
    let tag = Tag.selfClosing(.image)
    var attributes = [Attribute]()

    private let source: String
    private let alternateText: String

    init(_ source: String, alternateText: String) {
        self.source = source
        self.alternateText = alternateText
    }

    var element: String {
        let allAttributes = attributes.map { $0.description }.joined(separator: " ")
        let isEmptyAttribute = attributes.isEmpty || allAttributes.isEmpty
        let finalAttribute = isEmptyAttribute ? "" : " " + allAttributes
        return "<\(tag.description) src=\"\(source)\" alt=\"\(alternateText)\"\(finalAttribute)>"
    }
}
