//
//  SizeModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

struct SizeModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    typealias Body = ContentView

    private let width: AutoDimension?
    private let height: AutoDimension?

    init(width: AutoDimension?, height: AutoDimension?) {
        self.width = width
        self.height = height
    }

    func body(content: Content) -> Body {
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
