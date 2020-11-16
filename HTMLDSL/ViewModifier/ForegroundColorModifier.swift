//
//  ForegroundColorModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

struct ForegroundColorModifier<ContentView>: ViewModifier where ContentView: HTMLBodyTextContentView {
    typealias Content = ContentView
    typealias Body = ContentView

    private let color: Color

    init(color: Color) {
        self.color = color
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .foregroundColor(.Red), with: .foregroundColor(color))
    }
}
