//
//  ClassModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

public enum CSSTag: String {
    case hover = "hover"
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
    case gridItem
    case gridImage
    case gridSubHeading

    // MARK: Flex
    case flexibleContainer = "flex-container"
    case flexibleContainerHorizontal
    case flexibleContainerVertical
    
    // MARK: Article
    case article
    case markdown
    case intro
    case imageCredits
    
    // MARK: New Index
    case sectionHeader
    case sectionHeaderContent
    case sectionHeaderHero
    case link
    
    // MARK: Common
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subheadline
    
    case centerText
    case centerDivContainerX
    case centerDivContainerY
    case centerDivContainer
    case imageFullWidth
    case imageHalfWidth
    
    case desktopHidden
    case mobileHidden
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
