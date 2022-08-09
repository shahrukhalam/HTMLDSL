//
//  Div.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

public struct Div<Content>: HTMLBodyContentView where Content: HTMLBodyContentView {
    public var body: Content

    public let tag = Tag.enclosing(.div)
    public var attributes = [Attribute]()

    public init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}
