//
//  ImageLink.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

public struct ImageLink<Content>: HTMLBodyLinkContentView where Content: HTMLBodyImageContentView {
    public var body: Content
    public let tag = Tag.enclosing(.link)
    public var attributes = [Attribute]()

    public let url: String

    public init(url: String, @LinkViewBuilder content: () -> Content) {
        self.body = content()

        self.url = url
        attributes.append(.href(url))
    }
}
