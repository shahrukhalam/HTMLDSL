//
//  IDModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

struct IDModifier<ContentView>: ViewModifier where ContentView: HTMLBodyView {
    typealias Body = ContentView

    private let id: Attribute.HTMLID

    init(id: Attribute.HTMLID) {
        self.id = id
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .id(""), with: .id(id))
    }
}
