//
//  BackgroundColorModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

public struct BackgroundColorModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView

    private let color: Color

    public init(color: Color) {
        self.color = color
    }

    public func body(content: Content) -> Body {
        return update(content: content, for: .backgroundColor(.html(.Black)), with: .backgroundColor(color))
    }
}
