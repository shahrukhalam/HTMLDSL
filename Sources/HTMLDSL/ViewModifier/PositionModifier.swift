//
//  PositionModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 26/12/20.
//

import Foundation

struct PositionModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    typealias Body = ContentView

    private let position: Position

    private let left: AutoInheritInitialDimension
    private let top: AutoInheritInitialDimension
    private let right: AutoInheritInitialDimension
    private let bottom: AutoInheritInitialDimension

    init(position: Position,
         left: AutoInheritInitialDimension,
         top: AutoInheritInitialDimension,
         right: AutoInheritInitialDimension,
         bottom: AutoInheritInitialDimension) {
        self.position = position
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
    }

    func body(content: Content) -> Body {
        let updatedPosition = update(content: content,
                                     for: .position(.static),
                                     with: .position(position))

        return update(content: updatedPosition,
                      for: .constraint(left: .auto,
                                       top: .auto,
                                       right: .auto,
                                       bottom: .auto),
                      with: .constraint(left: left,
                                        top: top,
                                        right: right,
                                        bottom: bottom))
    }
}
