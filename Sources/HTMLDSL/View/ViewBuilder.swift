//
//  ViewBuilder.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

@resultBuilder
public struct ViewBuilder {
    public static func buildBlock<Content>(_ content: Content) -> Content where Content: HTMLView {
        return content
    }

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1)]
        return AnyView(views)
    }

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView, C2 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1), AnyView(c2)]
        return AnyView(views)
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView, C2 : HTMLContentView, C3 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3)]
        return AnyView(views)
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView, C2 : HTMLContentView, C4 : HTMLContentView, C3 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4)]
        return AnyView(views)
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView, C2 : HTMLContentView, C3 : HTMLContentView, C4 : HTMLContentView, C5 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4), AnyView(c5)]
        return AnyView(views)
    }
}
