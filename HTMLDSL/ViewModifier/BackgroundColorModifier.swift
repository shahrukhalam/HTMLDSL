//
//  BackgroundColorModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

struct BackgroundColorModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    typealias Body = ContentView

    private let color: Color

    init(color: Color) {
        self.color = color
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .backgroundColor(.html(.Black)), with: .backgroundColor(color))
    }
}
