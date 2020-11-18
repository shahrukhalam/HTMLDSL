//
//  ImageLink.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

struct ImageLink<Content>: HTMLBodyLinkContentView where Content: HTMLBodyImageContentView {
    var body: Content
    let tag = Tag.enclosing(.link)
    var attributes = [Attribute]()

    private let url: String

    init(url: String, @LinkViewBuilder content: () -> Content) {
        self.body = content()
        self.url = url
    }

    var element: String {
        let allAttributes = " " + attributes.map { $0.description }.joined(separator: " ")
        let finalAttribute = attributes.isEmpty ? "" : allAttributes
        return "<\(tag.description) href=\"\(url)\"\(finalAttribute)>\n\(body.element)\n</\(tag.description)>"
    }
}
