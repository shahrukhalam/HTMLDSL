//
//  ViewModifier + Extension.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

extension ViewModifier where Content == Body {
    func update(content: Content, for oldStyle: Style, with newStyle: Style) -> Body {
        var newContent = content
        var newStyles = [Style]()
        var newAttributes = content.attributes
        newAttributes.enumerated().forEach { (index, attribute) in
            if case .style(let styles) = attribute {
                newStyles = styles
                let indexOfStyle = newStyles.firstIndex { style in oldStyle == style }
                if let indexOfStyle = indexOfStyle { newStyles.remove(at: indexOfStyle) }
                newAttributes.remove(at: index)
            }
        }

        newStyles.append(newStyle)
        newAttributes.append(.style(newStyles))
        newContent.attributes = newAttributes
        return newContent
    }
}
