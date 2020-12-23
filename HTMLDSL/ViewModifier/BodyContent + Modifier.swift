//
//  BodyContent + Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

extension HTMLBodyContentView {
    func identifyBy(id: String) -> some HTMLBodyContentView {
        let modifier = IDModifier<Self>(id: id)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func identifyBy(cssClass: CSSClass) -> some HTMLBodyContentView {
        let modifier = ClassModifier<Self>(cssClass: cssClass)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func backgroundColor(_ color: Color) -> some HTMLBodyContentView {
        let modifier = BackgroundColorModifier<Self>(color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func size(width: Dimension? = nil, height: Dimension? = nil) -> some HTMLBodyContentView {
        let modifier = SizeModifier<Self>(width: width, height: height)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
