//
//  Style.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

enum Style: CustomStringConvertible, Hashable {
    case backgroundColor(Color)
    case foregroundColor(Color)

    case width(Int)
    case height(Int)
    case size(width: Int, height: Int)

    var description: String {
        switch self {
        case .backgroundColor(let color):
            return "background-color:\(color.rawValue);"
        case .foregroundColor(let color):
            return "color:\(color.rawValue);"
        case .width(let width):
            return "width:\(width)px;"
        case .height(let height):
            return "height:\(height)px;"
        case .size(let width, let height):
            return "width:\(width)px;height:\(height)px;"
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
        case (.size, .size):
            return true
        default:
            return false
        }
    }
}
