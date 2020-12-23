//
//  FlexibleContainer.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

struct FlexibleContainer<Content>: HTMLBodyContentView where Content: HTMLBodyContentView {
    var content: Content

    let tag = Tag.empty
    var attributes = [Attribute]()

    init(@LinkViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some HTMLBodyContentView {
        let modifier = ClassModifier<Content>(cssClass: .flexibleContainer)
        let modifiedBody = ModifiedContent(content: content, modifier: modifier)
        return modifiedBody
    }

    var element: String { body.element }
}
