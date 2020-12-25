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

    private func modified(body: CSSStyle, oldStyle: Style, with newStyle: Style) -> Self {
        var newStyles = body.styles
        newStyles.removeAll { style in style == oldStyle }
        newStyles.append(newStyle)

        switch body {
        case is TagStyle:
            return TagStyle(for: key, with: newStyles) as! Self
        case is ClassStyle:
            return ClassStyle(for: key, with: newStyles) as! Self
        default:
            preconditionFailure("No other Style is supported yet")
        }
    }

    func backgroundColor(_ color: Color) -> Self {
        modified(body: self, oldStyle: .backgroundColor(.html(.Black)), with: .backgroundColor(color))
    }

    func size(width: AutoDimension? = nil, height: AutoDimension? = nil) -> Self {
        var body = self

        if let width = width {
            body = modified(body: self, oldStyle: .width(.auto), with: .width(width))
        }

        if let height = height {
            body = modified(body: body, oldStyle: .height(.auto), with: .height(height))
        }

        return body
    }

    func margin(left: AutoInheritDimension = .auto,
                top: AutoInheritDimension = .auto,
                right: AutoInheritDimension = .auto,
                bottom: AutoInheritDimension = .auto) -> Self {
        modified(body: self,
                 oldStyle: .margin(left: .auto,
                                   top: .auto,
                                   right: .auto,
                                   bottom: .auto),
                 with: .margin(left: left,
                               top: top,
                               right: right,
                               bottom: bottom))
    }

    func margin(uniform: AutoInheritDimension) -> Self {
        modified(body: self,
                 oldStyle: .margin(left: .auto,
                                   top: .auto,
                                   right: .auto,
                                   bottom: .auto),
                 with: .margin(left: uniform,
                               top: uniform,
                               right: uniform,
                               bottom: uniform))
    }

    func padding(left: InheritDimension,
                 top: InheritDimension,
                 right: InheritDimension,
                 bottom: InheritDimension) -> Self {
        modified(body: self,
                 oldStyle: .padding(left: .inherit,
                                    top: .inherit,
                                    right: .inherit,
                                    bottom: .inherit),
                 with: .padding(left: left,
                                top: top,
                                right: right,
                                bottom: bottom))
    }

    func padding(uniform: InheritDimension) -> Self {
        modified(body: self,
                 oldStyle: .padding(left: .inherit,
                                    top: .inherit,
                                    right: .inherit,
                                    bottom: .inherit),
                 with: .padding(left: uniform,
                                top: uniform,
                                right: uniform,
                                bottom: uniform))
    }

    func position(_ position: Position,
                  left: AutoInheritInitialDimension = .auto,
                  top: AutoInheritInitialDimension = .auto,
                  right: AutoInheritInitialDimension = .auto,
                  bottom: AutoInheritInitialDimension = .auto) -> Self {
        var body: Self
        body = modified(body: self, oldStyle: .position(.static), with: .position(position))
        body = modified(body: body, oldStyle: .constraint(left: .auto,
                                                          top: .auto,
                                                          right: .auto,
                                                          bottom: .auto),
                        with: .constraint(left: left,
                                          top: top,
                                          right: right,
                                          bottom: bottom))
        return body
    }

    func foregroundColor(_ color: Color) -> Self {
        modified(body: self, oldStyle: .foregroundColor(.html(.Black)), with: .foregroundColor(color))
    }

    func font(family: FontFamily) -> Self {
        modified(body: self, oldStyle: .fontFamily(.sansSerif([])), with: .fontFamily(family))
    }

    func font(size: FontSize) -> Self {
        modified(body: self, oldStyle: .fontSize(.pixel(16)), with: .fontSize(size))
    }

    func font(weight: FontWeight) -> Self {
        modified(body: self, oldStyle: .fontWeight(.normal), with: .fontWeight(weight))
    }

    func align(_ alignment: TextAlignment) -> Self {
        modified(body: self, oldStyle: .textAlignment(.left), with: .textAlignment(alignment))
    }

    func filter(saturationInPercentage: Int,
                blurInPixel: Int) -> Self {
        return modified(body: self,
                        oldStyle: .filter(saturationInPercentage: 0, blurInPixel: 0),
                        with: .filter(saturationInPercentage: saturationInPercentage,
                                      blurInPixel: blurInPixel))
    }

    func display(_ display: Display) -> Self {
        return modified(body: self,
                        oldStyle: .display(.initial),
                        with: .display(display))
    }

    func textDecoration(_ decoration: TextDecoration) -> Self {
        return modified(body: self,
                        oldStyle: .textDecoration(.none),
                        with: .textDecoration(decoration))
    }
}

struct TagStyle: CSSStyle {
    var styles = [Style]()
    let key: CustomStringConvertible

    init(for tag: Tag) {
        self.key = tag.description
    }

    fileprivate init(for key: CustomStringConvertible, with style: [Style]) {
        self.key = key
        self.styles = style
    }
}

struct ClassStyle: CSSStyle {
    var styles = [Style]()
    let key: CustomStringConvertible

    init(forClass: CSSClass) {
        let isEmptyKey = forClass.description.isEmpty
        self.key = isEmptyKey ? "" : ".\(forClass.description)"
    }

    init(forClass: CSSClass, withTag: Tag) {
        switch (forClass, withTag) {
        case (.empty, .empty):
            self.key = ""
        default:
            self.key = ".\(forClass.description) \(withTag.description)"
        }
    }

    fileprivate init(for key: CustomStringConvertible, with style: [Style]) {
        self.key = key
        self.styles = style
    }
}
