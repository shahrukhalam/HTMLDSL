//
//  Style.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

public enum Style: CustomStringConvertible, Equatable {
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
    case boxSizing(BoxSizing)

    case position(Position)
    case constraint(left: AutoInheritInitialDimension,
                    top: AutoInheritInitialDimension,
                    right: AutoInheritInitialDimension,
                    bottom: AutoInheritInitialDimension)
    case transform(Transform)

    case foregroundColor(Color)
    case fontFamily(FontFamily)
    case fontSize(FontSize)
    case fontWeight(FontWeight)
    case textAlignment(TextAlignment)
    case textDecoration(TextDecoration)
    case lineHeight(AutoDimension)

    case filter(saturationInPercentage: Int, blurInPixel: Int)

    case display(Display)

    case backgroundImage(String)
    case backgroundPosition(BackgroundPosition)
    case backgroundRepeat(BackgroundRepeat)
    case backgroundSize(BackgroundSize)

    case zIndex(Int)
    
    // MARK: List
    case listImage(String)

    // MARK: Grid
    case gridColumnGap(Int)
    case gridRowGap(Int)
    case gridTemplateColumns([AutoDimension])

    // MARK: Flex
    case flexDirection(StackViewDirection)
    case flexAlignAlongAxis(StackViewAlignment)
    case flexDistributeOnCrossAxis(StackViewDistribution)
    
    // MARK: Pointer
    case pointer(PointerEvent)
    
    // MARK: Border
    case borderWidth(AutoDimension)
    case borderColor(Color)
    case borderLeft
    case cornerRadius([AutoDimension])

    public var description: String {
        switch self {
        case .backgroundColor(let color):
            return "background-color: \(color.description);"
        case .foregroundColor(let color):
            return "color: \(color.description);"
        case .width(let dimension):
            return "width: \(dimension.description);"
        case .height(let dimension):
            return "height: \(dimension.description);"
        case .fontFamily(let fontFamily):
            return "font-family: \(fontFamily.description);"
        case .fontSize(let fontSize):
            return "font-size: \(fontSize.description);"
        case .fontWeight(let fontWeight):
            return "font-weight: \(fontWeight.description);"
        case .textAlignment(let alignment):
            return "text-align: \(alignment.rawValue);"
        case let .margin(left, top, right, bottom):
            return "margin: \(top.description) \(right.description) \(bottom.description) \(left.description);"
        case let .padding(left, top, right, bottom):
            return "padding: \(top.description) \(right.description) \(bottom.description) \(left.description);"
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
        case .boxSizing(let size):
            return "box-sizing: \(size.rawValue);"
        case .backgroundImage(let url):
            return "background-image: url(\(url));"
        case .backgroundPosition(let position):
            return "background-position: \(position.rawValue);"
        case .backgroundRepeat(let repeatMode):
            return "background-repeat: \(repeatMode.rawValue);"
        case .backgroundSize(let size):
            return "background-size: \(size.description);"
        case .zIndex(let index):
            return "z-index: \(index);"
        case .transform(let transform):
            return "transform: \(transform.description);"
        case .gridColumnGap(let gap):
            return "grid-column-gap: \(gap)px;"
        case .gridRowGap(let gap):
            return "grid-row-gap: \(gap)px;"
        case .gridTemplateColumns(let columnDimensions):
            let templateColumns = columnDimensions.map { $0.description }.joined(separator: " ")
            return "grid-template-columns: \(templateColumns);"
        case .flexDirection(let direction):
            return "flex-direction: \(direction.rawValue);"
        case .flexAlignAlongAxis(let alignment):
            return "justify-content: \(alignment.rawValue);"
        case .flexDistributeOnCrossAxis(let distribution):
            return "align-items: \(distribution.rawValue);"
        case .pointer(let event):
            return "pointer-events: \(event.rawValue);"
        case .lineHeight(let dimension):
            return "line-height: \(dimension.description);"
        case .borderWidth(let dimension):
            return "border-width: \(dimension.description);"
        case .borderColor(let color):
            return "border-color: \(color.description);"
        case .borderLeft:
            return "border-left-style: solid;"
        case .cornerRadius(let dimensions):
            let description = dimensions.map { $0.description }.joined(separator: " ")
            return "border-radius: \(description);"
        case .listImage(let url):
            return "list-style-image: url(\"\(url)\");"
        }
    }

    public static func == (lhs: Style, rhs: Style) -> Bool {
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
        case (.boxSizing, .boxSizing):
            return true
        case (.backgroundImage, .backgroundImage):
            return true
        case (.backgroundPosition, .backgroundPosition):
            return true
        case (.backgroundRepeat, .backgroundRepeat):
            return true
        case (.backgroundSize, .backgroundSize):
            return true
        case (.zIndex, .zIndex):
            return true
        case (.transform, .transform):
            return true
        case (.gridColumnGap, .gridColumnGap):
            return true
        case (.gridRowGap, .gridRowGap):
            return true
        case (.gridTemplateColumns, .gridTemplateColumns):
            return true
        case (.flexDirection, .flexDirection):
            return true
        case (.flexAlignAlongAxis, .flexAlignAlongAxis):
            return true
        case (.flexDistributeOnCrossAxis, .flexDistributeOnCrossAxis):
            return true
        case (.pointer, .pointer):
            return true
        case (.lineHeight, .lineHeight):
            return true
        case (.borderWidth, .borderWidth):
            return true
        case (.borderColor, .borderColor):
            return true
        case (.cornerRadius, .cornerRadius):
            return true
        case (.borderLeft, .borderLeft):
            return true
        case (.listImage, .listImage):
            return true
        default:
            return false
        }
    }
}
