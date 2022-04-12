//
//  Document.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Document<Content>: View where Content: HTMLView {
    var body: Content

    let indentation: Indentation = .none
    let tag = Tag.selfClosing(.document)
    var attributes = [Attribute]()

    init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}
