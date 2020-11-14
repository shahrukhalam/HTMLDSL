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

    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1)]
        return AnyView(views)
    }
}
