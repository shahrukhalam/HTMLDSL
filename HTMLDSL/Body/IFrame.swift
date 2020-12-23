//
//  IFrame.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

struct IFrame: HTMLBodyContentView {
    typealias Body = Never
    let tag = Tag.enclosing(.iframe)
    var attributes = [Attribute]()

    private let source: String
    private let title: String

    init(_ source: String, title: String) {
        self.source = source
        self.title = title
    }

    var element: String {
        let allAttributes = attributes.map { $0.description }.joined(separator: " ")
        let isEmptyAttribute = attributes.isEmpty || allAttributes.isEmpty
        let finalAttribute = isEmptyAttribute ? "" : " " + allAttributes
        return "<\(tag.description) src=\"\(source)\" title=\"\(title)\"\(finalAttribute)></\(tag.description)>"
    }
}
