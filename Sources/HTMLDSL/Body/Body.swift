//
//  Body.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public struct Body<Content>: HTMLBodyView where Content: HTMLBodyContentView {
    public var body: Content

    public let newLine: NewLine = .one
    public let tag = Tag.enclosing(.body)
    public var attributes = [Attribute]()

    public init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}
