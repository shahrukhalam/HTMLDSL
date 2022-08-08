//
//  Div.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 24/12/20.
//

import Foundation

struct Div<Content>: HTMLBodyContentView where Content: HTMLBodyContentView {
    var body: Content

    let tag = Tag.enclosing(.div)
    var attributes = [Attribute]()

    init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}
