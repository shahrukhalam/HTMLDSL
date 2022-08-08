//
//  BackgroundImageModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 05/01/21.
//

import Foundation

struct BackgroundImageModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    typealias Body = ContentView

    private let path: String

    init(path: String) {
        self.path = path
    }

    func body(content: Content) -> Body {
        return update(content: content, for: .backgroundImage(""), with: .backgroundImage(path))
    }
}
