//
//  ClassModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

public enum CSSTag: String {
    case hoverLink = "a:hover"
}

public enum CSSClass: String {
    case empty = ""

    // MARK: Custom Classes for Index
    case indexNav
    case activeLink
    case inactiveLink

    case centeredText

    case heroImage
    case heroHeading
    case heroSubHeading

    // MARK: Grid
    case gridContainer
    case gridImage
    case gridSubHeading

    // MARK: Flex
    case flexibleContainer = "flex-container"
    case flexibleContainerHorizontal
    case flexibleContainerVertical
    
    // MARK: Markdown
    case article
    
    // MARK: Markdown
    case markdown
}

public struct ClassModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView

    private let cssClass: CSSClass

    public init(cssClass: CSSClass) {
        self.cssClass = cssClass
    }

    public func body(content: Content) -> Body {
        return update(content: content, for: .class(.empty), with: .class(cssClass))
    }
}
