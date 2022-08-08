//
//  PageBoxStyle.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 26/12/20.
//

import Foundation

struct PageBorderBoxStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init() {
        let boxStyle = PageStyle().boxSize(.borderBox)
        self.element = boxStyle.element
    }
}
