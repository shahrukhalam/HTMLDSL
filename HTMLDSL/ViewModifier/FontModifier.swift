//
//  FontModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 17/11/20.
//

import Foundation

struct FontModifier<ContentView>: ViewModifier where ContentView: HTMLBodyTextContentView {
    typealias Body = ContentView

    private let size: FontSize?
    private let font: FontFamily?

    init(size: FontSize?, font: FontFamily?) {
        self.size = size
        self.font = font
    }

    func body(content: Content) -> Body {
        switch (size, font) {
        case (.none, .none):
            return content
        case (.none, .some(let font)):
            return update(content: content, for: .fontFamily(FontFamily.serif([.serif])), with: .fontFamily(font))
        case (.some(let size), .none):
            return update(content: content, for: .fontSize(.percentage(100)), with: .fontSize(size))
        case (.some(let size), .some(let font)):
            let updatedFontSize = update(content: content, for: .fontSize(.percentage(100)), with: .fontSize(size))
            let updatedFontSizeAndFamily = update(content: updatedFontSize, for: .fontFamily(FontFamily.serif([.serif])), with: .fontFamily(font))
            return updatedFontSizeAndFamily
        }
    }
}

struct FontWeightModifier<ContentView>: ViewModifier where ContentView: HTMLBodyTextContentView {
    typealias Body = ContentView

    private let weight: FontWeight

    init(weight: FontWeight) {
        self.weight = weight
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .fontWeight(.normal), with: .fontWeight(weight))
    }
}
