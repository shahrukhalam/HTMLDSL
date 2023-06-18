//
//  CSSStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

public protocol CSSStyle {
    var key: CustomStringConvertible { get }
    var styles: [Style] { get }
    var element: String { get }
}

public extension CSSStyle {
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
        case is PageStyle:
            return PageStyle(style: newStyles) as! Self
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
    
    func sizeFull() -> Self {
        size(width: .percentage(100), height: .percentage(100))
    }

    func margin(left: AutoInheritDimension = .pixel(0),
                top: AutoInheritDimension = .pixel(0),
                right: AutoInheritDimension = .pixel(0),
                bottom: AutoInheritDimension = .pixel(0)) -> Self {
        modified(body: self,
                 oldStyle: .margin(left: .pixel(0),
                                   top: .pixel(0),
                                   right: .pixel(0),
                                   bottom: .pixel(0)),
                 with: .margin(left: left,
                               top: top,
                               right: right,
                               bottom: bottom))
    }

    func margin(uniform: AutoInheritDimension) -> Self {
        modified(body: self,
                 oldStyle: .margin(left: .pixel(0),
                                   top: .pixel(0),
                                   right: .pixel(0),
                                   bottom: .pixel(0)),
                 with: .margin(left: uniform,
                               top: uniform,
                               right: uniform,
                               bottom: uniform))
    }

    func centerX(top: AutoInheritDimension = .pixel(0), bottom: AutoInheritDimension = .pixel(0)) -> Self {
        modified(body: self,
                 oldStyle: .margin(left: .pixel(0),
                                   top: .pixel(0),
                                   right: .pixel(0),
                                   bottom: .pixel(0)),
                 with: .margin(left: .auto,
                               top: top,
                               right: .auto,
                               bottom: bottom))
    }

    func centerY(left: AutoInheritDimension = .pixel(0), right: AutoInheritDimension = .pixel(0)) -> Self {
        modified(body: self,
                 oldStyle: .margin(left: .pixel(0),
                                   top: .pixel(0),
                                   right: .pixel(0),
                                   bottom: .pixel(0)),
                 with: .margin(left: left,
                               top: .auto,
                               right: right,
                               bottom: .auto))
    }

    func padding(left: InheritDimension = .pixel(0),
                 top: InheritDimension = .pixel(0),
                 right: InheritDimension = .pixel(0),
                 bottom: InheritDimension = .pixel(0)) -> Self {
        modified(body: self,
                 oldStyle: .padding(left: .pixel(0),
                                    top: .pixel(0),
                                    right: .pixel(0),
                                    bottom: .pixel(0)),
                 with: .padding(left: left,
                                top: top,
                                right: right,
                                bottom: bottom))
    }

    func padding(uniform: InheritDimension) -> Self {
        modified(body: self,
                 oldStyle: .padding(left: .pixel(0),
                                    top: .pixel(0),
                                    right: .pixel(0),
                                    bottom: .pixel(0)),
                 with: .padding(left: uniform,
                                top: uniform,
                                right: uniform,
                                bottom: uniform))
    }

    func position(_ position: Position) -> Self {
        return modified(body: self,
                        oldStyle: .position(.static),
                        with: .position(position))
    }

    func constraint(left: AutoInheritInitialDimension = .auto,
                    top: AutoInheritInitialDimension = .auto,
                    right: AutoInheritInitialDimension = .auto,
                    bottom: AutoInheritInitialDimension = .auto) -> Self {
        return modified(body: self,
                        oldStyle: .constraint(left: .auto,
                                              top: .auto,
                                              right: .auto,
                                              bottom: .auto),
                        with: .constraint(left: left,
                                          top: top,
                                          right: right,
                                          bottom: bottom))
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
    
    func lineHeight(_ dimension: AutoDimension) -> Self {
        modified(body: self, oldStyle: .lineHeight(.auto), with: .lineHeight(dimension))
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

    func boxSize(_ size: BoxSizing) -> Self {
        return modified(body: self,
                        oldStyle: .boxSizing(.initial),
                        with: .boxSizing(size))
    }

    func backgroundImage(url: String) -> Self {
        return modified(body: self,
                        oldStyle: .backgroundImage(""),
                        with: .backgroundImage(url))
    }

    func backgroundPosition(_ position: BackgroundPosition) -> Self {
        return modified(body: self,
                        oldStyle: .backgroundPosition(.initial),
                        with: .backgroundPosition(position))
    }

    func backgroundRepeat(_ mode: BackgroundRepeat) -> Self {
        return modified(body: self,
                        oldStyle: .backgroundRepeat(.initial),
                        with: .backgroundRepeat(mode))
    }

    func backgroundSize(_ size: BackgroundSize) -> Self {
        return modified(body: self,
                        oldStyle: .backgroundSize(.initial),
                        with: .backgroundSize(size))
    }

    func zIndex(_ index: Int) -> Self {
        return modified(body: self,
                        oldStyle: .zIndex(0),
                        with: .zIndex(index))
    }

    func transform(_ transform: Transform) -> Self {
        return modified(body: self,
                        oldStyle: .transform(.translate(X: .pixel(0), Y: .pixel(0))),
                        with: .transform(transform))
    }
    
    // MARK: List
    func listImage(url: String) -> Self {
        return modified(body: self, oldStyle: .listImage(""), with: .listImage(url))
    }

    // MARK: Grid
    func gridColumn(gap: Int) -> Self {
        return modified(body: self,
                        oldStyle: .gridColumnGap(0),
                        with: .gridColumnGap(gap))
    }
    
    func gridRow(gap: Int) -> Self {
        return modified(body: self,
                        oldStyle: .gridRowGap(0),
                        with: .gridRowGap(gap))
    }
    
    /// Equal Width Problem: https://css-tricks.com/equal-width-columns-in-css-grid-are-kinda-weird/
    func gridNumberOfColumns(_ columns: Int) -> Self {
        return modified(body: self,
                        oldStyle: .gridTemplateColumns(0),
                        with: .gridTemplateColumns(columns))
    }
    
    /// Grid Column Location & Size by Line
    /// By Line is really important (see `Grid Lines` section of https://www.w3schools.com/css/css_grid.asp)
    ///
    /// For a 2 column template:
    /// - Equal size as template: 1 / 2
    /// - Double size as template: 1 / 3
    ///
    func gridColumn(location: Int, size: Int) -> Self {
        return modified(body: self,
                        oldStyle: .gridColumn(start: 0, end: 0),
                        with: .gridColumn(start: location, end: size))
    }

    // MARK: Flex
    func flexDirection(_ direction: StackViewDirection) -> Self {
        return modified(body: self,
                        oldStyle: .flexDirection(.horizontal),
                        with: .flexDirection(direction))
    }

    /// Along the Axis
    func flexAlign(_ alignment: StackViewAlignment) -> Self {
        return modified(body: self,
                        oldStyle: .flexAlignAlongAxis(.stretch),
                        with: .flexAlignAlongAxis(alignment))
    }

    /// Perpendicular the Axis
    func flexDistribute(_ distribution: StackViewDistribution) -> Self {
        return modified(body: self,
                        oldStyle: .flexDistributeOnCrossAxis(.flexStart),
                        with: .flexDistributeOnCrossAxis(distribution))
    }
    
    func flexWrap() -> Self {
        return modified(body: self,
                        oldStyle: .flexWrap,
                        with: .flexWrap)
    }
    
    // MARK: Pointer
    func pointer(_ event: PointerEvent) -> Self {
        modified(body: self, oldStyle: .pointer(.auto), with: .pointer(event))
    }
    
    // MARK: Border
    func border(sides: [Side] = Side.allCases, width: AutoDimension = .pixel(2), color: Color = .html(.Black)) -> Self {
        modified(body: self, oldStyle: .border(sides: [], width: .auto, color: .html(.Black)), with: .border(sides: sides, width: width, color: color))
    }
    
    func cornerRadius(uniform: AutoDimension) -> Self {
        modified(body: self, oldStyle: .cornerRadius([.auto, .auto, .auto, .auto]), with: .cornerRadius([uniform, uniform, uniform, uniform]))
    }
}

public struct TagStyle: CSSStyle {
    public var styles = [Style]()
    public let key: CustomStringConvertible

    public init(for tag: Tag) {
        self.key = tag.description
    }
    
    public init(for tags: [Tag]) {
        self.key = tags.map { $0.description }.joined(separator: ", ")
    }

    public init(for tag: Tag, with cssTag: CSSTag) {
        self.key = tag.description + ":" + cssTag.rawValue
    }

    fileprivate init(for key: CustomStringConvertible, with style: [Style]) {
        self.key = key
        self.styles = style
    }
}

public struct ClassStyle: CSSStyle {
    public var styles = [Style]()
    public let key: CustomStringConvertible

    /// every element with a class named `some-class`
    public init(forClass: CSSClass) {
        let isEmptyKey = forClass.value.isEmpty
        self.key = isEmptyKey ? "" : ".\(forClass.value)"
    }

    /// every element within a class named `some-class`
    public init(elementsInClass: CSSClass) {
        let isEmptyKey = elementsInClass.value.isEmpty
        self.key = isEmptyKey ? "" : ".\(elementsInClass.value) *"
    }

    /// every child element with a tag named `some-tag` of a parent element with class named `some-class`
    public init(forClass: CSSClass, withTag: Tag) {
        switch (forClass, withTag) {
        case (.empty, .empty):
            self.key = ""
        default:
            self.key = ".\(forClass.value) \(withTag.description)"
        }
    }
    
    /// every child element with a tag named `some-child-tag`
    /// of a parent element with tag named `some-tag`
    /// of a parent element with class named `some-class`
    public init(parent1: CSSClass, parent12: Tag, child: Tag) {
        self.key = "." + parent1.value + " " + parent12.description + " " + child.description
    }
    
    /// every child element with a class named `some-child-class` of a parent element with class named `some-class`
    public init(forClass: CSSClass, withClass: CSSClass) {
        self.key = ".\(forClass.value) .\(withClass.value)"
    }
    
    /// on `hover` of an element with class `some-class`
    public init(forClass: CSSClass, withCSSTag: CSSTag) {
        self.key = ".\(forClass.value):\(withCSSTag.rawValue)"
    }
    
    /// every child `link` on `hover` of a parent class named `some-class`
    public init(_ class: CSSClass, cssTag: CSSTag, tag: Tag) {
        self.key = ".\(`class`.value):\(cssTag.rawValue)" + " " + tag.description
    }
    
    /// on `hover` of every `link` contained in a class named `some-class`
    public init(_ class: CSSClass, tag: Tag, cssTag: CSSTag) {
        self.key = "." + `class`.value + " " + tag.description + ":" + cssTag.rawValue
    }

    fileprivate init(for key: CustomStringConvertible, with style: [Style]) {
        self.key = key
        self.styles = style
    }
}

public struct PageStyle: CSSStyle {
    public var styles = [Style]()
    public let key: CustomStringConvertible = "*"

    public init() {  }

    fileprivate init(style: [Style]) {
        self.styles = style
    }
}
