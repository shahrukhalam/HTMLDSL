//
//  Document.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public struct Document<Content>: View where Content: HTMLView {
    public var body: Content

    public let tag = Tag.selfClosing(.document)
    public var attributes = [Attribute]()

    public init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }

    public var element: String {
        "<\(tag.description)>\n\(body.element)"
    }
}
