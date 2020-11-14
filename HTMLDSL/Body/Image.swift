//
//  Image.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Image: HTMLBodyContentView {
    typealias Body = Never
    let tag = Tag.selfClosing(.image)

    private let source: String
    private let alternateText: String

    init(_ source: String, alternateText: String) {
        self.source = source
        self.alternateText = alternateText
    }

    var element: String {
        "<\(tag.description) src=\"\(source)\" alt=\"\(alternateText)\">"
    }
}
