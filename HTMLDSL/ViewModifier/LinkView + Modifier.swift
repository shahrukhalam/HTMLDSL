//
//  LinkView + Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

extension HTMLBodyLinkContentView {
    func backgroundColor(_ color: Color) -> some HTMLBodyLinkContentView {
        let modifier = BackgroundColorModifier<Self>(color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func size(width: Dimension? = nil, height: Dimension? = nil) -> some HTMLBodyLinkContentView {
        let modifier = SizeModifier<Self>(width: width, height: height)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func target(_ target: Target) -> some HTMLBodyLinkContentView {
        let modifier = TargetModifier<Self>(target: target)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
