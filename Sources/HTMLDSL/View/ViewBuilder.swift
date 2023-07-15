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
    
    public static func buildOptional<Content>(_ content: Content?) -> some HTMLBodyContentView where Content: HTMLBodyContentView {
        guard let content = content else { return AnyView(EmptyView()) }
        return AnyView(content)
    }
    
    public static func buildOptional<Content>(_ content: Content?) -> some HTMLHeadContentView where Content: HTMLHeadContentView {
        guard let content = content else { return AnyView(EmptyView()) }
        return AnyView(content)
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
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView, C2 : HTMLContentView, C3 : HTMLContentView, C4 : HTMLContentView, C5 : HTMLContentView, C6 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4), AnyView(c5), AnyView(c6)]
        return AnyView(views)
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView, C2 : HTMLContentView, C3 : HTMLContentView, C4 : HTMLContentView, C5 : HTMLContentView, C6 : HTMLContentView, C7 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4), AnyView(c5), AnyView(c6), AnyView(c7)]
        return AnyView(views)
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> AnyView where C0 : HTMLContentView, C1 : HTMLContentView, C2 : HTMLContentView, C3 : HTMLContentView, C4 : HTMLContentView, C5 : HTMLContentView, C6 : HTMLContentView, C7 : HTMLContentView, C8 : HTMLContentView {
        let views = [AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4), AnyView(c5), AnyView(c6), AnyView(c7), AnyView(c8)]
        return AnyView(views)
    }
}
