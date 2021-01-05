//
//  IndexBodyStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 26/12/20.
//

import Foundation

struct IndexBodyStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init() {
        let bodyStyle = TagStyle(for: .enclosing(.body))
            .margin(uniform: .pixel(0))
            .font(family: .sansSerif([.SFProDisplay,
                                      .SFProIcons,
                                      .HelveticaNeue,
                                      .Helvetica,
                                      .Arial]))

        self.element = bodyStyle.element
    }
}
