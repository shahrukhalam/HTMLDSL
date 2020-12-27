//
//  ClassModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

enum CSSTag: String {
    case hoverLink = "a:hover"
}

enum CSSClass: String {
    case empty = ""

    // Custom Classes for Index
    case indexNav
    case activeLink
    case inactiveLink

    case centeredText

    case heroImage
    case heroHeading
    case heroSubHeading

    // Grid
    case gridContainer
    case gridImage
    case gridSubHeading

    // Flex
    case flexibleContainer = "flex-container"
    case flexibleContainerHorizontal
    case flexibleContainerVertical
}

struct ClassModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    typealias Body = ContentView

    private let cssClass: CSSClass

    init(cssClass: CSSClass) {
        self.cssClass = cssClass
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .class(.empty), with: .class(cssClass))
    }
}
