//
//  View + Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

extension HTMLContentView {
    func identifyBy(id: String) -> ModifiedContent<Self, IDModifier<Self>> {
        let modifier = IDModifier<Self>(id: id)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func identifyBy(cssClass: CSSClass) -> ModifiedContent<Self, ClassModifier<Self>> {
        let modifier = ClassModifier<Self>(cssClass: cssClass)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func backgroundColor(_ color: Color) -> ModifiedContent<Self, BackgroundColorModifier<Self>> {
        let modifier = BackgroundColorModifier<Self>(color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func size(width: AutoDimension? = nil, height: AutoDimension? = nil) -> ModifiedContent<Self, SizeModifier<Self>> {
        let modifier = SizeModifier<Self>(width: width, height: height)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func margin(left: AutoInheritDimension,
                top: AutoInheritDimension,
                right: AutoInheritDimension,
                bottom: AutoInheritDimension) -> ModifiedContent<Self, MarginModifier<Self>> {
        let modifier = MarginModifier<Self>(left: left,
                                            top: top,
                                            right: right,
                                            bottom: bottom)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func padding(left: InheritDimension,
                 top: InheritDimension,
                 right: InheritDimension,
                 bottom: InheritDimension) -> ModifiedContent<Self, PaddingModifier<Self>> {
        let modifier = PaddingModifier<Self>(left: left,
                                             top: top,
                                             right: right,
                                             bottom: bottom)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func position(_ position: Position,
                  left: AutoInheritInitialDimension = .auto,
                  top: AutoInheritInitialDimension = .auto,
                  right: AutoInheritInitialDimension = .auto,
                  bottom: AutoInheritInitialDimension = .auto) -> ModifiedContent<Self, PositionModifier<Self>> {
        let modifier = PositionModifier<Self>(position: position,
                                              left: left,
                                              top: top,
                                              right: right,
                                              bottom: bottom)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
