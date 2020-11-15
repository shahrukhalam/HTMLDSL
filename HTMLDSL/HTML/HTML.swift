//
//  HTML.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct HTML<Content>: HTMLView where Content: HTMLContentView {
    var body: Content
    let tag = Tag.enclosing(.html)
    var attributes = Set<Attribute>()

    init(@HTMLViewBuilder content: () -> Content) {
        self.body = content()
    }
}
