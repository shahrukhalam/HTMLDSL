//
//  Link.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

public struct Link: HTMLBodyLinkContentView, HTMLBodyTextContentView {
    public var body: String
    public let tag = Tag.enclosing(.link)
    public var attributes = [Attribute]()

    public let text: String
    public let url: String

    public init(text: String, url: String) {
        self.text = text

        self.url = url
        attributes.append(.href(url))

        self.body = text
    }
}
