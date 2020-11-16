//
//  BackgroundColorModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

struct BackgroundColorModifier<ContentView>: ViewModifier where ContentView: View {
    typealias Content = ContentView
    typealias Body = ContentView

    private let color: Color

    init(color: Color) {
        self.color = color
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .backgroundColor(.red), with: .backgroundColor(color))
    }

    private func update(content: Content, for oldStyle: Style, with newStyle: Style) -> Content {
        var newContent = content
        var newStyles = Set<Style>()
        var newAttributes = content.attributes
        newAttributes.forEach { attribute in
            if case .style(let styles) = attribute {
                newStyles = styles
                let index = newStyles.firstIndex { style in oldStyle == style }
                if let index = index { newStyles.remove(at: index) }
                newAttributes.remove(attribute)
            }
        }

        newStyles.insert(newStyle)
        newAttributes.insert(.style(newStyles))
        newContent.attributes = newAttributes
        return newContent
    }
}
