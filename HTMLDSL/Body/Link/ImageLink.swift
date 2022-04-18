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

    let url: String

    init(url: String, @LinkViewBuilder content: () -> Content) {
        self.body = content()

        self.url = url
        attributes.append(.href(url))
    }
}
