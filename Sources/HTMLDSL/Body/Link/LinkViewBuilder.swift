//
//  LinkViewBuilder.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

@resultBuilder
public struct LinkViewBuilder {
    public static func buildBlock<Content>(_ content: Content) -> Content where Content: HTMLBodyImageContentView {
        return content
    }

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> AnyView where C0: HTMLBodyImageContentView, C1: HTMLBodyImageContentView {
        let views = [AnyView(c0), AnyView(c1)]
        return AnyView(views)
    }
}
