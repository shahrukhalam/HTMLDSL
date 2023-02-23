//
//  SizeModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

public struct SizeModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView

    private let width: AutoDimension?
    private let height: AutoDimension?

    public init(width: AutoDimension?, height: AutoDimension?) {
        self.width = width
        self.height = height
    }

    public func body(content: Content) -> Body {
        switch (width, height) {
        case (.none, .none):
            return content
        case (.none, .some(let dimension)):
            return update(content: content, for: .height(.auto), with: .height(dimension))
        case (.some(let dimension), .none):
            return update(content: content, for: .width(.auto), with: .width(dimension))
        case (.some(let width), .some(let height)):
            let updatedWidth = update(content: content, for: .width(.auto), with: .width(width))
            let updatedWidthAndHeight = update(content: updatedWidth, for: .height(.auto), with: .height(height))
            return updatedWidthAndHeight
        }
    }
}

public struct AspectRatioModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView

    private let width: Int
    private let height: Int

    public init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    public func body(content: Content) -> Body {
        return update(content: content, for: .aspectRatio(1, 1), with: .aspectRatio(width, height))
    }
}
