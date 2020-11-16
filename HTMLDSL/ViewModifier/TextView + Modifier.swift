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
}
