//
//  Style.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

enum Style: CustomStringConvertible, Equatable {
    case backgroundColor(Color)
    case width(AutoDimension)
    case height(AutoDimension)

    case margin(left: AutoInheritDimension,
                top: AutoInheritDimension,
                right: AutoInheritDimension,
                bottom: AutoInheritDimension)
    case padding(left: InheritDimension,
                 top: InheritDimension,
                 right: InheritDimension,
                 bottom: InheritDimension)

    case position(Position)
    case constraint(left: AutoInheritInitialDimension,
                    top: AutoInheritInitialDimension,
                    right: AutoInheritInitialDimension,
                    bottom: AutoInheritInitialDimension)

    case foregroundColor(Color)
    case fontFamily(FontFamily)
    case fontSize(FontSize)
    case fontWeight(FontWeight)
    case textAlignment(TextAlignment)
    case textDecoration(TextDecoration)

    case filter(saturationInPercentage: Int, blurInPixel: Int)

    case display(Display)

    var description: String {
        switch self {
        case .backgroundColor(let color):
            return "background-color:\(color.description);"
        case .foregroundColor(let color):
            return "color:\(color.description);"
        case .width(let dimension):
            return "width:\(dimension.description);"
        case .height(let dimension):
            return "height:\(dimension.description);"
        case .fontFamily(let fontFamily):
            return "font-family:\(fontFamily.description);"
        case .fontSize(let fontSize):
            return "font-size:\(fontSize.description);"
        case .fontWeight(let fontWeight):
            return "font-weight:\(fontWeight.description);"
        case .textAlignment(let alignment):
            return "text-align:\(alignment.rawValue);"
        case let .margin(left, top, right, bottom):
            return "margin: \(left.description) \(top.description) \(right.description) \(bottom.description);"
        case let .padding(left, top, right, bottom):
            return "padding: \(left.description) \(top.description) \(right.description) \(bottom.description);"
        case .position(let position):
            if case .sticky = position {
                return "position: -webkit-sticky;\nposition: \(position.rawValue);"
            }

            return "position: \(position.rawValue);"
        case let .constraint(left, top, right, bottom):
            return "left: \(left.description);\ntop: \(top.description);\nright: \(right.description);\nbottom: \(bottom.description);"
        case let .filter(saturation, blur):
            return "-webkit-backdrop-filter: saturate(\(saturation)%) blur(\(blur)px);\nbackdrop-filter: saturate(\(saturation)%) blur(\(blur)px);"
        case .display(let display):
            return "display: \(display.rawValue);"
        case .textDecoration(let decoration):
            return "text-decoration: \(decoration.rawValue);"
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
        case (.fontWeight, .fontWeight):
            return true
        case (.textAlignment, .textAlignment):
            return true
        case (.margin, .margin):
            return true
        case (.padding, .padding):
            return true
        case (.position, .position):
            return true
        case (.constraint, .constraint):
            return true
        case (.filter, .filter):
            return true
        case (.display, .display):
            return true
        case (.textDecoration, .textDecoration):
            return true
        default:
            return false
        }
    }
}
