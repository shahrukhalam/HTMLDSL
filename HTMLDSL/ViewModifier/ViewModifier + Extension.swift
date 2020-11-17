//
//  ViewModifier + Extension.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

extension ViewModifier {
    func update(content: Content, for oldStyle: Style, with newStyle: Style) -> Body {
        var newContent = content
        var newStyles = [Style]()
        var newAttributes = content.attributes
        newAttributes.enumerated().forEach { (index, attribute) in
            if case .style(let styles) = attribute {
                newStyles = styles
                newStyles.removeAll { style in oldStyle == style }
                newAttributes.remove(at: index)
            }
        }

        newStyles.append(newStyle)
        newAttributes.append(.style(newStyles))
        newContent.attributes = newAttributes
        return newContent
    }
}
