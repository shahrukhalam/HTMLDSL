//
//  Title.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public struct Title: HTMLHeadTextContentView {
    public typealias Body = Never
    public let tag = Tag.enclosing(.title)

    public let text: String

    public init(_ text: String) {
        self.text = text
    }
}

public extension HTMLHeadTextContentView {
    var element: String {
        return "<\(tag.description)>\(text)</\(tag.description)>"
    }
}
