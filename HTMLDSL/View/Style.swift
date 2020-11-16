//
//  Style.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

enum Style: CustomStringConvertible, Equatable {
    case backgroundColor(Color)
    case foregroundColor(Color)

    case width(Dimension)
    case height(Dimension)

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
        default:
            return false
        }
    }
}

enum Dimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case auto

    var description: String {
        switch self {
        case .percentage(let value):
            return "\(value)%"
        case .pixel(let value):
            return "\(value)px"
        case .auto:
            return "auto"
        }
    }
}
