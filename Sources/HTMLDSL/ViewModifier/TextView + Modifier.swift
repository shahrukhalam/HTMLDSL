//
//  TextView + Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

extension HTMLBodyTextContentView {
    func foregroundColor(_ color: Color) -> ModifiedContent<Self, ForegroundColorModifier<Self>> {
        let modifier = ForegroundColorModifier<Self>(color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func font(size: FontSize? = nil, family: FontFamily? = nil) -> ModifiedContent<Self, FontModifier<Self>> {
        let modifier = FontModifier<Self>(size: size, font: family)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func font(weight: FontWeight) -> ModifiedContent<Self, FontWeightModifier<Self>> {
        let modifier = FontWeightModifier<Self>(weight: weight)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func align(_ alignment: TextAlignment) -> ModifiedContent<Self, TextAlignmentModifier<Self>> {
        let modifier = TextAlignmentModifier<Self>(alignment: alignment)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
