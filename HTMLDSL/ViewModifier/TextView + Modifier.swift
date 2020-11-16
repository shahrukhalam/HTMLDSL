//
//  TextView + Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

extension HTMLBodyTextContentView {
    func backgroundColor(_ color: Color) -> some HTMLBodyTextContentView {
        let modifier = BackgroundColorModifier<Self>(color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func foregroundColor(_ color: Color) -> some HTMLBodyTextContentView {
        let modifier = ForegroundColorModifier<Self>(color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func size(width: Dimension? = nil, height: Dimension? = nil) -> some HTMLBodyTextContentView {
        let modifier = SizeModifier<Self>(width: width, height: height)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func font(size: FontSize? = nil, font: FontFamily? = nil) -> some HTMLBodyTextContentView {
        let modifier = FontModifier<Self>(size: size, font: font)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
