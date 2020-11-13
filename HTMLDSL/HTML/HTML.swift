//
//  HTML.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct HTML<Content>: HTMLView where Content: HTMLContentView {
    var body: Content

    init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}
