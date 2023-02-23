//
//  HTML.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public struct HTML<Content>: HTMLView where Content: HTMLContentView {
    public var body: Content

    public let tag = Tag.enclosing(.html)
    public var attributes: [Attribute] = [.language("en")]

    public init(@HTMLViewBuilder content: () -> Content) {
        self.body = content()
    }
}
