//
//  BackgroundColorModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

struct BackgroundColorModifier<ContentView>: ViewModifier where ContentView: View {
    typealias Content = ContentView
    typealias Body = ContentView

    private let color: Color

    init(color: Color) {
        self.color = color
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .backgroundColor(.Red), with: .backgroundColor(color))
    }
}
