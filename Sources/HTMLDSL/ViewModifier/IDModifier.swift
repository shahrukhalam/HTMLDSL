//
//  IDModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 23/12/20.
//

import Foundation

public struct IDModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView

    private let id: Attribute.HTMLID

    public init(id: Attribute.HTMLID) {
        self.id = id
    }

    public func body(content: Content) -> Body {
        return update(content: content, for: .id(""), with: .id(id))
    }
}
