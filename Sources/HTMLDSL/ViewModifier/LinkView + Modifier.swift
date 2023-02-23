//
//  LinkView + Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

public extension HTMLBodyLinkContentView {
    func target(_ target: Target) -> ModifiedContent<Self, TargetModifier<Self>> {
        let modifier = TargetModifier<Self>(target: target)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func accessibility(_ text: String) -> ModifiedContent<Self, AccessibilityModifier<Self>> {
        let modifier = AccessibilityModifier<Self>(text: text)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
