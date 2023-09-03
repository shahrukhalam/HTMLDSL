//
//  HeadStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 25/12/20.
//

import Foundation

@resultBuilder
public struct StyleBuilder {
    public static func buildBlock<Content>(_ content: Content) -> Content where Content: CSSStyle {
        return content
    }
    
    public static func buildEither<Content>(first content: Content) -> AnyStyle where Content: CSSStyle {
        AnyStyle(content: content)
    }
    
    public static func buildEither<Content>(second content: Content) -> AnyStyle where Content: CSSStyle {
        AnyStyle(content: content)
    }
    
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> AnyStyle where C0 : CSSStyle, C1 : CSSStyle {
        AnyStyle(contents: [c0, c1])
    }

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> AnyStyle where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle {
        AnyStyle(contents: [c0, c1, c2])
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> AnyStyle where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle {
        AnyStyle(contents: [c0, c1, c2, c3])
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> AnyStyle where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle {
        AnyStyle(contents: [c0, c1, c2, c3, c4])
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> AnyStyle where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle {
        AnyStyle(contents: [c0, c1, c2, c3, c4, c5])
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> AnyStyle where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle, C6 : CSSStyle {
        AnyStyle(contents: [c0, c1, c2, c3, c4, c5, c6])
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> AnyStyle where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle, C6 : CSSStyle, C7 : CSSStyle {
        AnyStyle(contents: [c0, c1, c2, c3, c4, c5, c6, c7])
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> AnyStyle where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle, C6 : CSSStyle, C7 : CSSStyle, C8 : CSSStyle {
        AnyStyle(contents: [c0, c1, c2, c3, c4, c5, c6, c7, c8])
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> AnyStyle where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle, C6 : CSSStyle, C7 : CSSStyle, C8 : CSSStyle, C9 : CSSStyle {
        AnyStyle(contents: [c0, c1, c2, c3, c4, c5, c6, c7, c8, c9])
    }
}

public struct HeadStyle: HTMLHeadContentView {
    public let body: String

    public let tag = Tag.enclosing(.style)

    public var attributes: [Attribute] = []

    public init<Content>(@StyleBuilder content: () -> Content) where Content: CSSStyle {
        let allStyles = content().element
        self.body = allStyles
    }
}
