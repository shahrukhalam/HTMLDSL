//
//  PositionModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 26/12/20.
//

import Foundation

public struct PositionModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView

    private let position: Position

    private let left: AutoInheritDimension
    private let top: AutoInheritDimension
    private let right: AutoInheritDimension
    private let bottom: AutoInheritDimension

    public init(position: Position,
         left: AutoInheritDimension,
         top: AutoInheritDimension,
         right: AutoInheritDimension,
         bottom: AutoInheritDimension) {
        self.position = position
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
    }

    public func body(content: Content) -> Body {
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
