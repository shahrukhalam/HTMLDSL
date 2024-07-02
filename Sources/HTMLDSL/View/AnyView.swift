//
//  AnyView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public struct AnyView: HTMLHeadContentView, HTMLBodyContentView, HTMLBodyImageContentView {
    public typealias Body = Never
    public let tag = Tag.empty

    public let element: String

    public init<Content>(_ content: Content) where Content: HTMLContentView {
        self.element = content.element
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public init<Content>(_ content: [Content]) where Content: HTMLContentView {
        self.element = content
            .map { $0.element }
            .joined(separator: "\n")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
