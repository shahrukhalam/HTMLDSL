//
//  Head.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public struct Head<Content>: HTMLHeadView where Content: HTMLHeadContentView {
    public var body: Content

    public let tag = Tag.enclosing(.head)
    public var attributes = [Attribute]()

    public init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}
