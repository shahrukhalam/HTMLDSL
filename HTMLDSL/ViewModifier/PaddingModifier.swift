//
//  PaddingModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

struct PaddingModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    typealias Body = ContentView
    
    private let left: PaddingDimension
    private let top: PaddingDimension
    private let right: PaddingDimension
    private let bottom: PaddingDimension
    
    init(left: PaddingDimension,
         top: PaddingDimension,
         right: PaddingDimension,
         bottom: PaddingDimension) {
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
