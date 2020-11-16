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

    func font(size: FontSize? = nil, family: FontFamily? = nil) -> some HTMLBodyTextContentView {
        let modifier = FontModifier<Self>(size: size, font: family)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func align(_ alignment: TextAlignment) -> some HTMLBodyTextContentView {
        let modifier = TextAlignmentModifier<Self>(alignment: alignment)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
