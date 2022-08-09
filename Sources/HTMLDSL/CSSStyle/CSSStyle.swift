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

    // MARK: Grid
    func gridColumn(gap: Int) -> Self {
        return modified(body: self,
                        oldStyle: .gridColumnGap(0),
                        with: .gridColumnGap(gap))
    }

    func gridNumberOfColumnsWithWidth(_ templates: [AutoDimension]) -> Self {
        return modified(body: self,
                        oldStyle: .gridTemplateColumns([]),
                        with: .gridTemplateColumns(templates))
    }

    // MARK: Flex
    func flexDirection(_ direction: StackViewDirection) -> Self {
        return modified(body: self,
                        oldStyle: .flexDirection(.horizontal),
                        with: .flexDirection(direction))
    }

    func flexAlign(_ alignment: StackViewAlignment) -> Self {
        return modified(body: self,
                        oldStyle: .flexAlignAlongAxis(.stretch),
                        with: .flexAlignAlongAxis(alignment))
    }

    func flexDistribute(_ distribution: StackViewDistribution) -> Self {
        return modified(body: self,
                        oldStyle: .flexDistributeOnCrossAxis(.flexStart),
                        with: .flexDistributeOnCrossAxis(distribution))
    }
    
    // MARK: Pointer
    func pointer(_ event: PointerEvent) -> Self {
        modified(body: self, oldStyle: .pointer(.auto), with: .pointer(event))
    }
}

public struct TagStyle: CSSStyle {
    public var styles = [Style]()
    public let key: CustomStringConvertible

    public init(for tag: Tag) {
        self.key = tag.description
    }

    public init(cssTag: CSSTag) {
        self.key = cssTag.rawValue
    }

    fileprivate init(for key: CustomStringConvertible, with style: [Style]) {
        self.key = key
        self.styles = style
    }
}

public struct ClassStyle: CSSStyle {
    public var styles = [Style]()
    public let key: CustomStringConvertible

    public init(forClass: CSSClass) {
        let isEmptyKey = forClass.rawValue.isEmpty
        self.key = isEmptyKey ? "" : ".\(forClass.rawValue)"
    }

    public init(forClass: CSSClass, withTag: Tag) {
        switch (forClass, withTag) {
        case (.empty, .empty):
            self.key = ""
        default:
            self.key = ".\(forClass.rawValue) \(withTag.description)"
        }
    }

    fileprivate init(for key: CustomStringConvertible, with style: [Style]) {
        self.key = key
        self.styles = style
    }
}

struct PageStyle: CSSStyle {
    var styles = [Style]()
    let key: CustomStringConvertible = "*"

    init() {  }

    fileprivate init(style: [Style]) {
        self.styles = style
    }
}
