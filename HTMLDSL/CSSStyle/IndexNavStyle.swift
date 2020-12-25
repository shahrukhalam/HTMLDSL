//
//  IndexNavStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 26/12/20.
//

import Foundation

struct IndexNavStyle: CSSStyle {
    let key: CustomStringConvertible = ""
    let styles = [Style]()
    
    var element: String

    init() {
        let navStyle = ClassStyle(forClass: .indexNav)
            .position(.fixed, top: .pixel(0), right: .pixel(0), bottom: .pixel(0))
            .backgroundColor(.rgba(red: 240, green: 240, blue: 240, alpha: 0.8))
            .align(.center)
            .filter(saturationInPercentage: 180, blurInPixel: 20)

        let linkStyle = ClassStyle(forClass: .indexNav, withTag: .enclosing(.link))
            .padding(uniform: .pixel(16))
            .foregroundColor(.html(.Black))
            .display(.inlineBlock)
            .textDecoration(.none)

        self.element = [navStyle, linkStyle].map { $0.element }.joined(separator: "\n")
    }
}
