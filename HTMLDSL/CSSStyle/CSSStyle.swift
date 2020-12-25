//
//  CSSStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

protocol CSSStyle {
    var key: CustomStringConvertible { get }
    var styles: [Style] { get }
    var element: String { get }
}

extension CSSStyle {
    var element: String {
        let allStyles = styles.map { $0.description }.joined(separator: "\n")
        let isEmptyStyle = styles.isEmpty || allStyles.isEmpty
        let finalStyle = isEmptyStyle ? "" : allStyles

        let isEmptyKey = key.description.isEmpty

        return isEmptyKey ? "" : "\(key) {\n\(finalStyle)\n}"
    }

    private func modified(oldStyle: Style, with newStyle: Style) -> Self {
        var newStyles = styles
        newStyles.removeAll { style in style == oldStyle }
        newStyles.append(newStyle)

        switch self {
        case is TagStyle:
            return TagStyle(for: key, with: newStyles) as! Self
        case is ClassStyle:
            return ClassStyle(for: key, with: newStyles) as! Self
        default:
            preconditionFailure("No other Style is supported yet")
        }
    }

    func backgroundColor(_ color: Color) -> Self {
        modified(oldStyle: .backgroundColor(.White), with: .backgroundColor(color))
    }

    func size(width: Dimension? = nil, height: Dimension? = nil) -> Self {
        var body = self

        if let width = width {
            body = modified(oldStyle: .width(.auto), with: .width(width))
        }

        if let height = height {
            body = modified(oldStyle: .height(.auto), with: .height(height))
        }

        return body
    }

    func margin(left: MarginDimension,
                top: MarginDimension,
                right: MarginDimension,
                bottom: MarginDimension) -> Self {
        modified(oldStyle: .margin(left: .auto,
                                   top: .auto,
                                   right: .auto,
                                   bottom: .auto),
                 with: .margin(left: left,
                               top: top,
                               right: right,
                               bottom: bottom))
    }

    func padding(left: PaddingDimension,
                 top: PaddingDimension,
                 right: PaddingDimension,
                 bottom: PaddingDimension) -> Self {
        modified(oldStyle: .padding(left: .inherit,
                                    top: .inherit,
                                    right: .inherit,
                                    bottom: .inherit),
                 with: .padding(left: left,
                                top: top,
                                right: right,
                                bottom: bottom))
    }
}

struct TagStyle: CSSStyle {
    let styles: [Style]
    let key: CustomStringConvertible

    init(for tag: Tag, with style: [Style] = []) {
        self.key = tag.description
        self.styles = style
    }

    fileprivate init(for key: CustomStringConvertible, with style: [Style]) {
        self.key = key
        self.styles = style
    }
}

struct ClassStyle: CSSStyle {
    let styles: [Style]
    let key: CustomStringConvertible

    init(for cssClass: CSSClass, with style: [Style] = []) {
        let isEmptyKey = cssClass.description.isEmpty

        self.key = isEmptyKey ? "" : ".\(cssClass.description)"
        self.styles = style
    }

    fileprivate init(for key: CustomStringConvertible, with style: [Style]) {
        self.key = key
        self.styles = style
    }
}
