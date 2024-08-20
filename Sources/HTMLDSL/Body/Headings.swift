//
//  Text.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public enum HeadingTag: String {
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
}

public struct Headings: HTMLBodyTextContentView {
    public var body: String

    public let tag: Tag
    public var attributes = [Attribute]()

    public let text: String

    public init(_ text: String, type: HeadingTag) {
        self.text = text

        self.tag = Tag.enclosing(.headings(type))
        self.body = text
    }
}
