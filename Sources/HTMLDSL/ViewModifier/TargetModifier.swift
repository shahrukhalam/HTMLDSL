//
//  TargetModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

public struct TargetModifier<ContentView>: ViewModifier where ContentView: HTMLBodyLinkContentView {
    public typealias Body = ContentView

    private let target: Target

    init(target: Target) {
        self.target = target
    }

    public func body(content: Content) -> Body {
        return update(content: content, for: .target(.sameWindowOrTab), with: .target(target))
    }
}
