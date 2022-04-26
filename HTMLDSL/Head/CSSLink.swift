//
//  CSSLink.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 05/01/21.
//

import Foundation

struct CSSLink: HTMLHeadContentView {
    let body: String

    let newLine: NewLine = .none
    let tag = Tag.selfClosing(.link)

    var attributes: [Attribute] = []

    private let path: String

    init(path: String) {
        self.path = path
        self.body = "rel=\"stylesheet\" href=\"\(path)\""
    }

//    var element: String {
//        "<\(tag.description) rel=\"stylesheet\" href=\"\(path)\">"
//    }
}
