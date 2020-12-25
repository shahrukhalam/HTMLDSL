//
//  HeadStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 25/12/20.
//

import Foundation

@_functionBuilder
struct StyleBuilder {
    static func buildBlock<Content>(_ content: Content) -> String where Content: CSSStyle {
        return content.element
    }

    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> String where C0 : CSSStyle, C1 : CSSStyle {
        let styles = [c0.element, c1.element]
        return styles.joined(separator: "\n")
    }
}

struct HeadStyle: HTMLHeadContentView {
    typealias Body = Never
    let tag = Tag.enclosing(.style)
    let attributes = [Attribute]()

    init(@StyleBuilder content: () -> String) {
        let allStyles = content()
        self.element = "<\(tag.description)>\n\(allStyles)\n</\(tag.description)>"
    }

    var element: String
}
