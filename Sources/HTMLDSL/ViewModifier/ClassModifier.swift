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
    
    // MARK: Article
    case article
    case markdown
    
    // MARK: New Index
    case sectionHeader
    
    // MARK: Common
    case primaryLargeTitle
    case secondaryLargeTitle
    case tertiaryLargeTitle
    case primaryTitle
    case secondaryTitle
    case tertiaryTitle
    case primarySmallTitle
    case secondarySmallTitle
    case tertiarySmallTitle
    case primaryLargeSubTitle
    case primarySubTitle
    case secondarySubTitle
    case tertiarySubTitle
    case centerText
    case centerDivX
    case centerDivY
}

public struct ClassModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView

    private let cssClasses: [CSSClass]
    
    public init(cssClass: CSSClass) {
        self.cssClasses = [cssClass]
    }

    public init(cssClasses: [CSSClass]) {
        self.cssClasses = cssClasses
    }

    public func body(content: Content) -> Body {
        return update(content: content, for: .class([.empty]), with: .class(cssClasses))
    }
}
