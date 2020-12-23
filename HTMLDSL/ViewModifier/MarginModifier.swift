//
//  MarginModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

struct MarginModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    typealias Body = ContentView
    
    private let left: MarginDimension
    private let top: MarginDimension
    private let right: MarginDimension
    private let bottom: MarginDimension
    
    init(left: MarginDimension,
         top: MarginDimension,
         right: MarginDimension,
         bottom: MarginDimension) {
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
    }
    
    func body(content: Content) -> Body {
        return update(content: content,
                      for: .margin(left: .auto,
                                   top: .auto,
                                   right: .auto,
                                   bottom: .auto),
                      with: .margin(left: left,
                                    top: top,
                                    right: right,
                                    bottom: bottom))
    }
}
