//
//  Body + Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

extension HTMLBodyView {
    func backgroundColor(_ color: Color) -> some HTMLBodyView {
        let modifier = BackgroundColorModifier<Self>(color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func size(width: Dimension? = nil, height: Dimension? = nil) -> some HTMLBodyView {
        let modifier = SizeModifier<Self>(width: width, height: height)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
