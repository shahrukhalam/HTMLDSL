//
//  LinkViewBuilder.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

@_functionBuilder
struct LinkViewBuilder {
    static func buildBlock<Content>(_ content: Content) -> Content where Content: HTMLBodyImageContentView {
        return content
    }
}
