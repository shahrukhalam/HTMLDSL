//
//  HeroImageStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 26/12/20.
//

import Foundation

struct HeroImageStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init(url: String,
         heightInPixel: Int,
         backgroundColor: Color = Color.TableBackgroundColor) {
        let heroImageStyle = ClassStyle(forClass: .heroImage)
            .backgroundImage(url: url)
            .backgroundColor(backgroundColor)
            .size(height: .pixel(heightInPixel))
            .backgroundPosition(.center)
            .backgroundRepeat(.noRepeat)
            .backgroundSize(.cover)
            .position(.relative)
            .zIndex(-1)

        self.element = heroImageStyle.element
    }
}

struct CenteredTextStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init(topInPixel: Int) {
        let centeredTextStyle = ClassStyle(forClass: .centeredText)
            .align(.center)
            .position(.absolute)
            .constraint(left: .percentage(50), top: .pixel(topInPixel))
            .transform(.translate(X: .percentage(-50), Y: .percentage(0)))

        self.element = centeredTextStyle.element
    }
}

struct HeroHeadingStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init(color: Color) {
        let heroHeading = ClassStyle(forClass: .heroHeading)
            .font(size: .pixel(44))
            .font(weight: .number(600))
            .foregroundColor(color)

        self.element = heroHeading.element
    }
}

struct HeroSubHeadingStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init(color: Color) {
        let heroSubHeading = ClassStyle(forClass: .heroSubHeading)
            .font(size: .pixel(40))
            .font(weight: .number(400))
            .foregroundColor(color)

        self.element = heroSubHeading.element
    }
}

struct GridContainerStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init(backgroundColor: Color = Color.TableBackgroundColor,
         numberOfColumnsWithWidth: [AutoDimension] = [.auto, .auto]) {
        let gridContainerStyle = ClassStyle(forClass: .gridContainer)
            .padding(uniform: .pixel(12))
            .display(.grid)
            .gridNumberOfColumnsWithWidth(numberOfColumnsWithWidth)
            .gridColumn(gap: 12)
            .backgroundColor(backgroundColor)

        self.element = gridContainerStyle.element
    }
}

struct GridImageStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init(url: String,
         heightInPixel: Int,
         backgroundColor: Color = Color.TableBackgroundColor) {
        let heroImageStyle = ClassStyle(forClass: .gridImage)
            .backgroundImage(url: url)
            .backgroundColor(backgroundColor)
            .size(height: .pixel(heightInPixel))
            .backgroundPosition(.center)
            .backgroundRepeat(.noRepeat)
            .backgroundSize(.cover)
            .position(.relative)

        self.element = heroImageStyle.element
    }
}

struct GridSubHeadingStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init(color: Color) {
        let gridSubHeading = ClassStyle(forClass: .gridSubHeading)
            .font(size: .pixel(19))
            .font(weight: .number(400))
            .foregroundColor(color)

        self.element = gridSubHeading.element
    }
}
