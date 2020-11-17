//
//  ImageView + Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

extension HTMLBodyImageContentView {
    func backgroundColor(_ color: Color) -> some HTMLBodyImageContentView {
        let modifier = BackgroundColorModifier<Self>(color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func size(width: Dimension? = nil, height: Dimension? = nil) -> some HTMLBodyImageContentView {
        let modifier = SizeModifier<Self>(width: width, height: height)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
