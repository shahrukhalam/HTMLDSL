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

    case margin(left: MarginDimension,
                top: MarginDimension,
                right: MarginDimension,
                bottom: MarginDimension)
    case padding(left: PaddingDimension,
                 top: PaddingDimension,
                 right: PaddingDimension,
                 bottom: PaddingDimension)

    case foregroundColor(Color)
    case fontFamily(FontFamily)
    case fontSize(FontSize)
    case textAlignment(TextAlignment)

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
        case .textAlignment(let alignment):
            return "text-align:\(alignment.rawValue);"
        case let .margin(left, top, right, bottom):
            return "margin: \(left.description) \(top.description) \(right.description) \(bottom.description);"
        case let .padding(left, top, right, bottom):
            return "padding: \(left.description) \(top.description) \(right.description) \(bottom.description);"
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
        case (.textAlignment, .textAlignment):
            return true
        case (.margin, .margin):
            return true
        case (.padding, .padding):
            return true
        default:
            return false
        }
    }
}
