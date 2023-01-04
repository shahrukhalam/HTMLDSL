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

public struct CSSClass: ExpressibleByStringLiteral, Equatable {
    let value: String

    public init(stringLiteral value: String) {
        self.value = value
    }

    static var empty: Self { "" }

    // MARK: Custom Classes for Demo Index Page
    static var indexNav: Self { #function }
    static var activeLink: Self { #function }
    static var inactiveLink: Self { #function }

    static var centeredText: Self { #function }

    // Hero
    static var heroImage: Self { #function }
    static var heroHeading: Self { #function }
    static var heroSubHeading: Self { #function }

    // Grid
    static var gridContainer: Self { #function }
    static var gridItem: Self { #function }
    static var gridImage: Self { #function }
    static var gridSubHeading: Self { #function }

    // Flex
    static var flexibleContainer: Self { "flex-container" }
    static var flexibleContainerHorizontal: Self { #function }
    static var flexibleContainerVertical: Self { #function }
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
