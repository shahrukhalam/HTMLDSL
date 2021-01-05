//
//  CSSLink.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 05/01/21.
//

import Foundation

struct CSSLink: HTMLHeadContentView {
    typealias Body = Never
    let tag = Tag.selfClosing(.link)

    private let path: String

    init(path: String) {
        self.path = path
    }

    var element: String {
        "<\(tag.description) rel=\"stylesheet\" href=\"\(path)\">"
    }
}
