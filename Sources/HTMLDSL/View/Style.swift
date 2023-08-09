//
//  Style.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

public enum ColorScheme: String {
    case light
    case dark
}

public enum Style: CustomStringConvertible, Equatable {
    case variable(CSSVariable<Color>, ColorScheme)
    
    case backgroundColor(Color)
    case backgroundVariable(CSSVariable<Color>)

    case width(AutoDimension)
    case height(AutoDimension)
    case maxWidth(AutoDimension)
    case aspectRatio(Int, Int)
    case contentMode(HTMLDSL.ContentMode)

    case margin(left: AutoInheritDimension,
                top: AutoInheritDimension,
                right: AutoInheritDimension,
                bottom: AutoInheritDimension)
    case padding(left: AutoInheritDimension,
                 top: AutoInheritDimension,
                 right: AutoInheritDimension,
                 bottom: AutoInheritDimension)
    case boxSizing(BoxSizing)

    case position(Position)
    case constraint(left: AutoInheritDimension,
                    top: AutoInheritDimension,
                    right: AutoInheritDimension,
                    bottom: AutoInheritDimension)
    case transform(Transform)

    case foregroundColor(Color)
    case foregroundVariable(CSSVariable<Color>)
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
    case gridColumnGapDimension(AutoInheritDimension)
    case gridRowGap(Int)
    case gridTemplateColumns(Int)
    case gridColumn(start: Int, end: Int)

    // MARK: Flex
    case flexDirection(StackViewDirection)
    case flexAlignAlongAxis(StackViewAlignment)
    case flexDistributeOnCrossAxis(StackViewDistribution)
    case flexWrap
    case flexGap(AutoInheritDimension)
    case flexRowGap(AutoInheritDimension)
    case flexColumnGap(AutoInheritDimension)
    
    // MARK: Pointer
    case pointer(PointerEvent)
    
    // MARK: Border
    case border(sides: [Side], width: AutoDimension, color: Color)
    case cornerRadius([AutoDimension])
    
    // MARK: Lines
    case noOfLines(Int)
    
    // MARK: Scroll
    case scrollVertically

    public var description: String {
        switch self {
        case .variable(let variable, let scheme):
            return "--\(variable.name): \(scheme == .light ? variable.value.light : variable.value.dark);"
        case .backgroundColor(let color):
            return "background-color: \(color.description);"
        case .backgroundVariable(let variable):
            return "background-color: var(--\(variable.name));"
        case .foregroundColor(let color):
            return "color: \(color.description);"
        case .foregroundVariable(let variable):
            return "color: var(--\(variable.name));"
        case .width(let dimension):
            return "width: \(dimension.description);"
        case .maxWidth(let dimension):
            return "max-width: \(dimension.description);"
        case .height(let dimension):
            return "height: \(dimension.description);"
        case .contentMode(let contentMode):
            return "object-fit: \(contentMode.rawValue);"
        case let .aspectRatio(width, height):
            return "aspect-ratio: \(width)/\(height);"
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
        case .gridColumnGapDimension(let dimension):
            return "grid-column-gap: \(dimension.description);"
        case .gridRowGap(let gap):
            return "grid-row-gap: \(gap)px;"
        case .gridTemplateColumns(let columns):
            return "grid-template-columns: repeat(\(columns), minmax(0, 1fr));"
        case let .gridColumn(start, end):
            return "grid-column: \(start) / \(end);"
        case .flexDirection(let direction):
            return "flex-direction: \(direction.rawValue);"
        case .flexAlignAlongAxis(let alignment):
            return "justify-content: \(alignment.rawValue);"
        case .flexDistributeOnCrossAxis(let distribution):
            return "align-items: \(distribution.rawValue);"
        case .flexWrap:
            return "flex-wrap: wrap;"
        case .flexGap(let gap):
            return "gap: \(gap.description);"
        case .flexRowGap(let gap):
            return "row-gap: \(gap.description);"
        case .flexColumnGap(let gap):
            return "column-gap: \(gap.description);"
        case .pointer(let event):
            return "pointer-events: \(event.rawValue);"
        case .lineHeight(let dimension):
            return "line-height: \(dimension.description);"
        case let .border(sides, width, color):
            let description = sides
                .map { side in
                    let sideBorder = "border-" + side.rawValue + ":"
                    let attributes = [sideBorder, width.description, "solid", color.description]
                    return attributes.joined(separator: " ") + ";"
                }
                .joined()
            return description
        case .cornerRadius(let dimensions):
            let description = dimensions.map { $0.description }.joined(separator: " ")
            return "border-radius: \(description);"
        case .noOfLines(let lines):
            return "overflow: hidden; text-overflow: ellipsis; display: -webkit-box;-webkit-line-clamp: \(lines); line-clamp: \(lines); -webkit-box-orient: vertical;"
        case .listImage(let url):
            return "list-style-image: url(\"\(url)\");"
        case .scrollVertically:
            return "overflow-y: scroll;"
        }
    }

    public static func == (lhs: Style, rhs: Style) -> Bool {
        switch (lhs, rhs) {
        case (.variable(let lhsVariable, let lhsScheme), .variable(let rhsVariable, let rhsScheme)):
            return lhsVariable.name == rhsVariable.name && lhsScheme == rhsScheme
        case (.backgroundColor, .backgroundColor):
            return true
        case (.backgroundVariable, .backgroundVariable):
            return true
        case (.foregroundColor, .foregroundColor):
            return true
        case (.foregroundVariable, .foregroundVariable):
            return true
        case (.width, .width):
            return true
        case (.maxWidth, .maxWidth):
            return true
        case (.height, .height):
            return true
        case (.aspectRatio, .aspectRatio):
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
        case (.gridColumnGapDimension, .gridColumnGapDimension):
            return true
        case (.gridRowGap, .gridRowGap):
            return true
        case (.gridTemplateColumns, .gridTemplateColumns):
            return true
        case (.gridColumn, .gridColumn):
            return true
        case (.flexDirection, .flexDirection):
            return true
        case (.flexAlignAlongAxis, .flexAlignAlongAxis):
            return true
        case (.flexDistributeOnCrossAxis, .flexDistributeOnCrossAxis):
            return true
        case (.flexWrap, .flexWrap):
            return true
        case (.flexGap, .flexGap):
            return true
        case (.flexRowGap, .flexRowGap):
            return true
        case (.flexColumnGap, .flexColumnGap):
            return true
        case (.pointer, .pointer):
            return true
        case (.lineHeight, .lineHeight):
            return true
        case (.border, .border):
            return true
        case (.cornerRadius, .cornerRadius):
            return true
        case (.noOfLines, .noOfLines):
            return true
        case (.listImage, .listImage):
            return true
        case (.scrollVertically, .scrollVertically):
            return true
        default:
            return false
        }
    }
}
