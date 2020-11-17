//
//  TextAlignmentModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 17/11/20.
//

import Foundation

struct TextAlignmentModifier<ContentView>: ViewModifier where ContentView: HTMLBodyTextContentView {
    typealias Body = ContentView

    private let alignment: TextAlignment

    init(alignment: TextAlignment) {
        self.alignment = alignment
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .textAlignment(.center), with: .textAlignment(alignment))
    }
}
