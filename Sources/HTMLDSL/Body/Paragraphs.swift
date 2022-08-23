//
//  Paragraphs.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public struct Paragraphs: HTMLBodyTextContentView, HTMLBodyImageContentView {
    public var body: String
    public let tag = Tag.enclosing(.paragraph)
    public var attributes = [Attribute]()

    public let text: String
    public init(_ text: String) {
        self.text = text
        self.body = text
    }
}
