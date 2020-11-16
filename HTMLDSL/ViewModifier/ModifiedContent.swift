//
//  ModifiedContent.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

struct ModifiedContent<Content, Modifier> {
    var content: Content
    let modifier: Modifier

    var attributes = Set<Attribute>()

    init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
    }
}
