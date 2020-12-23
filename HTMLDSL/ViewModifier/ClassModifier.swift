//
//  ClassModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

enum CSSClass: String {
    case empty
    case flexibleContainer = "flex-container"
}

struct ClassModifier<ContentView>: ViewModifier where ContentView: HTMLBodyView {
    typealias Body = ContentView

    private let cssClass: CSSClass

    init(cssClass: CSSClass) {
        self.cssClass = cssClass
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .class(.empty), with: .class(cssClass))
    }
}