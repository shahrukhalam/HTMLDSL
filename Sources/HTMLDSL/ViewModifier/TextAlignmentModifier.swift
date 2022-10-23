//
//  TextAlignmentModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 17/11/20.
//

import Foundation

public struct TextAlignmentModifier<ContentView>: ViewModifier where ContentView: HTMLBodyTextContentView {
    public typealias Body = ContentView

    private let alignment: TextAlignment

    init(alignment: TextAlignment) {
        self.alignment = alignment
    }

    public func body(content: Content) -> Body {
        return update(content: content, for: .textAlignment(.center), with: .textAlignment(alignment))
    }
}
