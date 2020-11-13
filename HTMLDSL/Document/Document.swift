//
//  Document.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Document<Content>: View where Content: HTMLView {
    var body: Content

    init(@ViewBuilder content: () -> Content) {
        self.body = content()
    }
}
