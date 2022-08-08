//
//  AnyView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct AnyView: HTMLHeadContentView, HTMLBodyContentView {
    typealias Body = Never
    let tag = Tag.empty

    let element: String

    init<Content>(_ content: Content) where Content: HTMLContentView {
        self.element = content.element
    }

    init<Content>(_ content: [Content]) where Content: HTMLContentView {
        self.element = content.map { $0.element }.joined(separator: "\n")
    }
}
