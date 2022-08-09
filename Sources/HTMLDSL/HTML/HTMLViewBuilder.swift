//
//  HTMLViewBuilder.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

@resultBuilder
public struct HTMLViewBuilder {
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> AnyView where C0 : HTMLHeadView, C1 : HTMLBodyView {
        let views = [AnyView(c0), AnyView(c1)]
        return AnyView(views)
    }
}
