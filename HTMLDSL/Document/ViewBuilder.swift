//
//  ViewBuilder.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

@_functionBuilder
struct ViewBuilder {
    static func buildBlock<Content>(_ content: Content) -> Content where Content: View {
        return content
    }

    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> AnyView where C0 : HTMLHeadView, C1 : HTMLBodyView {
        return AnyView(c0, c1)
    }
}

struct AnyView: HTMLContentView {
    typealias Body = Never
    let tag = Tag.empty

    let element: String

    init<C0, C1>(_ c0: C0, _ c1: C1) where C0 : HTMLHeadView, C1 : HTMLBodyView {
        self.element = c0.element + "\n" + c1.element
    }

    init<Content>(_ content: Content...) where Content: HTMLView {
        self.element = content.map { $0.element }.joined(separator: "\n")
    }
}
