//
//  PaddingModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

public struct PaddingModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView

    private let left: AutoInheritDimension
    private let top: AutoInheritDimension
    private let right: AutoInheritDimension
    private let bottom: AutoInheritDimension

    public init(left: AutoInheritDimension,
                top: AutoInheritDimension,
                right: AutoInheritDimension,
                bottom: AutoInheritDimension) {
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
    }

    public func body(content: Content) -> Body {
        return update(content: content,
                      for: .padding(left: .inherit,
                                    top: .inherit,
                                    right: .inherit,
                                    bottom: .inherit),
                      with: .padding(left: left,
                                     top: top,
                                     right: right,
                                     bottom: bottom))
    }
}
