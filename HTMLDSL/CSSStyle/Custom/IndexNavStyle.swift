//
//  IndexNavStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 26/12/20.
//

import Foundation

struct IndexNavStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init() {
        let navStyle = ClassStyle(forClass: .indexNav)
            .position(.fixed)
            .constraint(left: .pixel(0), top: .pixel(0), right: .pixel(0))
            .backgroundColor(.rgba(red: 240, green: 240, blue: 240, alpha: 0.8))
            .align(.center)
            .filter(saturationInPercentage: 180, blurInPixel: 20)

        let linkStyle = ClassStyle(forClass: .indexNav, withTag: .enclosing(.link))
            .padding(uniform: .pixel(16))
            .display(.inlineBlock)
            .textDecoration(.none)

        let activeLinkStyle = ClassStyle(forClass: .activeLink)
            .foregroundColor(.html(.Black))
        
        let inactiveLinkStyle = ClassStyle(forClass: .inactiveLink)
            .foregroundColor(Color.InactiveBlack)
        
        let hoverLinkStyle = TagStyle(cssTag: .hoverLink)
            .foregroundColor(.html(.Black))
        
        let classStyles = [navStyle, linkStyle, activeLinkStyle, inactiveLinkStyle]
            .map { $0.element }
        let tagStyles = [hoverLinkStyle].map { $0.element }
        let allStyles = classStyles + tagStyles
        self.element = allStyles
            .joined(separator: "\n")
    }
}
