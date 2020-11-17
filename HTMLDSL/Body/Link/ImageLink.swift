//
//  ImageLink.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

struct ImageLink<Content>: HTMLBodyContentView where Content: HTMLBodyImageContentView {
    var body: Content
    let tag = Tag.enclosing(.link)
    var attributes = [Attribute]()

    private let url: String
    let content: () -> Content

    init(url: String, @LinkViewBuilder content: @escaping () -> Content) {
        self.body = content()
        self.content = content
        self.url = url
    }

    var element: String {
        let allAttributes = " " + attributes.map { $0.description }.joined(separator: " ")
        let finalAttribute = attributes.isEmpty ? "" : allAttributes
        return "<\(tag.description) href=\"\(url)\"\(finalAttribute)>\n\(body.element)\n</\(tag.description)>"
    }

    func target(_ attribute: Target) -> ImageLink<Content> {
        var link = ImageLink(url: url, content: content)
        link.attributes = attributes + [.target(attribute)]
        return link
    }
}
