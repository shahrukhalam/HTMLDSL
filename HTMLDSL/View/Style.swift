//
//  Style.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

enum Style: CustomStringConvertible, Equatable {
    case backgroundColor(Color)
    case width(Dimension)
    case height(Dimension)

    case foregroundColor(Color)
    case fontFamily(FontFamily)
    case fontSize(FontSize)

    var description: String {
        switch self {
        case .backgroundColor(let color):
            return "background-color:\(color.rawValue);"
        case .foregroundColor(let color):
            return "color:\(color.rawValue);"
        case .width(let dimension):
            return "width:\(dimension.description);"
        case .height(let dimension):
            return "height:\(dimension.description);"
        case .fontFamily(let fontFamily):
            return "font-family:\(fontFamily.description);"
        case .fontSize(let fontSize):
            return "font-size:\(fontSize.description);"
        }
    }

    static func == (lhs: Style, rhs: Style) -> Bool {
        switch (lhs, rhs) {
        case (.backgroundColor, .backgroundColor):
            return true
        case (.foregroundColor, .foregroundColor):
            return true
        case (.width, .width):
            return true
        case (.height, .height):
            return true
        case (.fontFamily, .fontFamily):
            return true
        case (.fontSize, .fontSize):
            return true
        default:
            return false
        }
    }
}
