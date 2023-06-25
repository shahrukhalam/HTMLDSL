//
//  View + Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

public extension HTMLContentView {
    func identifyBy(id: String) -> ModifiedContent<Self, IDModifier<Self>> {
        let modifier = IDModifier<Self>(id: id)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func identifyBy(cssClasses: [CSSClass]) -> ModifiedContent<Self, ClassModifier<Self>> {
        let modifier = ClassModifier<Self>(cssClasses: cssClasses)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func identifyBy(cssClass: CSSClass) -> ModifiedContent<Self, ClassModifier<Self>> {
        let modifier = ClassModifier<Self>(cssClasses: [cssClass])
        return ModifiedContent(content: self, modifier: modifier)
    }

    func backgroundColor(_ color: Color) -> ModifiedContent<Self, BackgroundColorModifier<Self>> {
        let modifier = BackgroundColorModifier<Self>(color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func backgroundImage(path: String) -> ModifiedContent<Self, BackgroundImageModifier<Self>> {
        let modifier = BackgroundImageModifier<Self>(path: path)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func size(width: AutoDimension? = nil, height: AutoDimension? = nil) -> ModifiedContent<Self, SizeModifier<Self>> {
        let modifier = SizeModifier<Self>(width: width, height: height)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func sizeFull() -> ModifiedContent<Self, SizeModifier<Self>> {
        size(width: .percentage(100), height: .percentage(100))
    }

    func aspectRatio(width: Int, height: Int) -> ModifiedContent<Self, AspectRatioModifier<Self>> {
        let modifier = AspectRatioModifier<Self>(width: width, height: height)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func contentMode(_ contentMode: ContentMode) -> ModifiedContent<Self, ContentModeModifier<Self>> {
        let modifier = ContentModeModifier<Self>(contentMode: contentMode)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func margin(left: AutoInheritDimension = .pixel(0),
                top: AutoInheritDimension = .pixel(0),
                right: AutoInheritDimension = .pixel(0),
                bottom: AutoInheritDimension = .pixel(0)) -> ModifiedContent<Self, MarginModifier<Self>> {
        let modifier = MarginModifier<Self>(left: left,
                                            top: top,
                                            right: right,
                                            bottom: bottom)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func margin(uniform dimension: AutoInheritDimension) -> ModifiedContent<Self, MarginModifier<Self>> {
        let modifier = MarginModifier<Self>(left: dimension,
                                            top: dimension,
                                            right: dimension,
                                            bottom: dimension)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func centerX() -> ModifiedContent<Self, MarginModifier<Self>> {
        margin(left: .auto, right: .auto)
    }

    func padding(left: AutoInheritDimension = .pixel(0),
                 top: AutoInheritDimension = .pixel(0),
                 right: AutoInheritDimension = .pixel(0),
                 bottom: AutoInheritDimension = .pixel(0)) -> ModifiedContent<Self, PaddingModifier<Self>> {
        let modifier = PaddingModifier<Self>(left: left,
                                             top: top,
                                             right: right,
                                             bottom: bottom)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func padding(uniform dimension: AutoInheritDimension) -> ModifiedContent<Self, PaddingModifier<Self>> {
        let modifier = PaddingModifier<Self>(left: dimension,
                                             top: dimension,
                                             right: dimension,
                                             bottom: dimension)
        return ModifiedContent(content: self, modifier: modifier)
    }

    func position(_ position: Position,
                  left: AutoInheritDimension = .auto,
                  top: AutoInheritDimension = .auto,
                  right: AutoInheritDimension = .auto,
                  bottom: AutoInheritDimension = .auto) -> ModifiedContent<Self, PositionModifier<Self>> {
        let modifier = PositionModifier<Self>(position: position,
                                              left: left,
                                              top: top,
                                              right: right,
                                              bottom: bottom)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func position(_ position: Position,
                  uniform: AutoInheritDimension = .auto) -> ModifiedContent<Self, PositionModifier<Self>> {
        let modifier = PositionModifier<Self>(position: position,
                                              left: uniform,
                                              top: uniform,
                                              right: uniform,
                                              bottom: uniform)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func border(sides: [Side] = Side.allCases, width: AutoDimension = .pixel(2), color: Color = .html(.Black)) -> ModifiedContent<Self, BorderModifier<Self>> {
        let modifier = BorderModifier<Self>(sides: sides, width: width, color: color)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func cornerRadius(_ dimension: AutoDimension) -> ModifiedContent<Self, CornerModifier<Self>> {
        let modifier = CornerModifier<Self>(dimension: dimension)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func cornerRadius(_ dimensions: [AutoDimension]) -> ModifiedContent<Self, CornerModifier<Self>> {
        let modifier = CornerModifier<Self>(dimensions: dimensions)
        return ModifiedContent(content: self, modifier: modifier)
    }
    
    func display(_ display: Display) -> ModifiedContent<Self, DisplayModifier<Self>> {
        let modifier = DisplayModifier<Self>(display: display)
        return ModifiedContent(content: self, modifier: modifier)
    }
}
