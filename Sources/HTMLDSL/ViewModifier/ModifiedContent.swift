//
//  ModifiedContent.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

public struct ModifiedContent<Content, Modifier> {
    public var content: Content
    public let modifier: Modifier

    public var attributes = [Attribute]()

    public init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
    }
}
