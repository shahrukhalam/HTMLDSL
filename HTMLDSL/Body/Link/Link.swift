//
//  Link.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

struct Link: HTMLBodyLinkContentView {
    typealias Body = Never
    let tag = Tag.enclosing(.link)
    var attributes = [Attribute]()

    private let text: String
    private let url: String

    init(text: String, url: String) {
        self.text = text
        self.url = url
    }

    var element: String {
        let allAttributes = " " + attributes.map { $0.description }.joined(separator: " ")
        let finalAttribute = attributes.isEmpty ? "" : allAttributes
        return "<\(tag.description) href=\"\(url)\"\(finalAttribute)>\(text)</\(tag.description)>"
    }
}
