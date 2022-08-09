//
//  BackgroundImageModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 05/01/21.
//

import Foundation

public struct BackgroundImageModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView

    private let path: String

    public init(path: String) {
        self.path = path
    }

    public func body(content: Content) -> Body {
        return update(content: content, for: .backgroundImage(""), with: .backgroundImage(path))
    }
}
