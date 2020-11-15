//
//  Head.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Head<Content>: HTMLHeadView where Content: HTMLHeadContentView {
    var body: Content
    let tag = Tag.enclosing(.head)
    var attributes = Set<Attribute>()

    init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}
