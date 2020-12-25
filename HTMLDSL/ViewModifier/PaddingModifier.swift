//
//  PaddingModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

struct PaddingModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    typealias Body = ContentView

    private let left: InheritDimension
    private let top: InheritDimension
    private let right: InheritDimension
    private let bottom: InheritDimension

    init(left: InheritDimension,
         top: InheritDimension,
         right: InheritDimension,
         bottom: InheritDimension) {
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
    }

    func body(content: Content) -> Body {
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
