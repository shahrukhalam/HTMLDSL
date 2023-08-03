//
//  BackgroundImageModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 05/01/21.
//

import Foundation

public struct BackgroundImageModifier<ContentView>: ViewModifier where ContentView: HTMLView {
    public typealias Body = ContentView

    private let path: String
    private let position: BackgroundPosition
    private let size: BackgroundSize
    private let repeating: BackgroundRepeat

    public init(
        path: String,
        position: BackgroundPosition = .inherit,
        size: BackgroundSize = .inherit,
        repeating: BackgroundRepeat = .inherit
    ) {
        self.path = path
        self.position = position
        self.size = size
        self.repeating = repeating
    }

    public func body(content: Content) -> Body {
        let body1 = update(content: content, for: .backgroundImage(""), with: .backgroundImage(path))
        let body2 = update(content: body1, for: .backgroundPosition(.inherit), with: .backgroundPosition(position))
        let body3 = update(content: body2, for: .backgroundSize(.inherit), with: .backgroundSize(size))
        let body4 = update(content: body3, for: .backgroundRepeat(.inherit), with: .backgroundRepeat(repeating))
        return body4
    }
}
