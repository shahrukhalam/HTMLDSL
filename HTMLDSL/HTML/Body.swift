//
//  Body.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Body<Content>: HTMLBodyView where Content: HTMLBodyContentView {
    var body: Content

    init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}
