//
//  Link.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

struct Link: HTMLBodyLinkContentView {
    var body: String
    let tag = Tag.enclosing(.link)
    var attributes = [Attribute]()

    private let text: String
    let url: String

    init(text: String, url: String) {
        self.text = text

        self.url = url
        attributes.append(.href(url))

        self.body = text
    }
}
