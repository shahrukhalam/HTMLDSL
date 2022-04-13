//
//  Text.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

enum HeadingTag: String {
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
}

struct Headings: HTMLBodyTextContentView {
    var body: String

    let newLine: NewLine = .none

    let tag: Tag
    var attributes = [Attribute]()

    let text: String

    init(_ text: String, type: HeadingTag = .h1) {
        self.text = text

        self.tag = Tag.enclosing(.headings(type))
        self.body = text
    }
}

extension String: View {
    typealias Body = Never
    var tag: Tag { fatalError("It's a last element of the hierarchy: Doesn't have a real Tag") }
    var element: String { self }
}
