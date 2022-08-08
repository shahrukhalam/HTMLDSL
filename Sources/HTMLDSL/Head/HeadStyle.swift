//
//  HeadStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 25/12/20.
//

import Foundation

@resultBuilder
struct StyleBuilder {
    static func buildBlock<Content>(_ content: Content) -> String where Content: CSSStyle {
        return content.element
    }

    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> String where C0 : CSSStyle, C1 : CSSStyle {
        let styles = [c0.element, c1.element]
        return styles.joined(separator: "\n")
    }

    static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> String where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle {
        let styles = [c0.element, c1.element, c2.element]
        return styles.joined(separator: "\n")
    }

    static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> String where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle {
        let styles = [c0.element, c1.element, c2.element, c3.element]
        return styles.joined(separator: "\n")
    }

    static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> String where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle {
        let styles = [c0.element, c1.element, c2.element, c3.element, c4.element]
        return styles.joined(separator: "\n")
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> String where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle {
        let styles = [c0.element, c1.element, c2.element, c3.element, c4.element, c5.element]
        return styles.joined(separator: "\n")
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> String where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle, C6 : CSSStyle {
        let styles = [c0.element, c1.element, c2.element, c3.element, c4.element, c5.element, c6.element]
        return styles.joined(separator: "\n")
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> String where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle, C6 : CSSStyle, C7 : CSSStyle {
        let styles = [c0.element, c1.element, c2.element, c3.element, c4.element, c5.element, c6.element, c7.element]
        return styles.joined(separator: "\n")
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> String where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle, C6 : CSSStyle, C7 : CSSStyle, C8 : CSSStyle {
        let styles = [c0.element, c1.element, c2.element, c3.element, c4.element, c5.element, c6.element, c7.element, c8.element]
        return styles.joined(separator: "\n")
    }

    static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> String where C0 : CSSStyle, C1 : CSSStyle, C2 : CSSStyle, C3 : CSSStyle, C4 : CSSStyle, C5 : CSSStyle, C6 : CSSStyle, C7 : CSSStyle, C8 : CSSStyle, C9 : CSSStyle {
        let styles = [c0.element, c1.element, c2.element, c3.element, c4.element, c5.element, c6.element, c7.element, c8.element, c9.element]
        return styles.joined(separator: "\n")
    }
}

struct HeadStyle: HTMLHeadContentView {
    let body: String

    let tag = Tag.enclosing(.style)

    var attributes: [Attribute] = []

    init(@StyleBuilder content: () -> String) {
        let allStyles = content()
        self.body = allStyles
    }
}
