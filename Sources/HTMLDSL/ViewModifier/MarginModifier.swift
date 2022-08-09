//
//  MarginModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

public struct MarginModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
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
