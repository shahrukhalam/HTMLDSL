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
    let rawValue: String

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    static let empty: Self = ""

    // MARK: Custom Classes for Demo Index Page
    static let indexNav: Self = #function
    static let activeLink: Self = #function
    static let inactiveLink: Self = #function

    static let centeredText: Self = #function

    // Hero
    static let heroImage: Self = #function
    static let heroHeading: Self = #function
    static let heroSubHeading: Self = #function

    // Grid
    static let gridContainer: Self = #function
    static let gridItem: Self = #function
    static let gridImage: Self = #function
    static let gridSubHeading: Self = #function

    // Flex
    static let flexibleContainer: Self = "flex-container"
    static let flexibleContainerHorizontal: Self = #function
    static let flexibleContainerVertical: Self = #function
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
