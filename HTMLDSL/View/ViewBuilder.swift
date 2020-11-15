//
//  ViewBuilder.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

@_functionBuilder
struct ViewBuilder {
    static func buildBlock<Content>(_ content: Content) -> Content where Content: HTMLView {
        return content
    }

    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1)]
        return AnyView(views)
    }

    static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView, C2 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1), AnyView(c2)]
        return AnyView(views)
    }
}
