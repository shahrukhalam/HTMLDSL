//
//  ClassModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

enum CSSClass: CustomStringConvertible {
    case empty
    case flexibleContainer

    // Custom Classes for Index
    case indexNav
    case indexIntro

    var description: String {
        switch self {
        case .empty:
            return ""
        case .flexibleContainer:
            return "flex-container"
        case .indexNav:
            return "indexNav"
        case .indexIntro:
            return "indexIntro"
        }
    }
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
