//
//  Title.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Title: HTMLHeadContentView {
    typealias Body = Never
    let tag = Tag.enclosing(.title)

    private let text: String

    init(_ text: String) {
        self.text = text
    }

    var element: String {
        let spaceCount: Int = indentation.rawValue
        let indentation = Array(repeating: " ", count: spaceCount).joined(separator: "")
        return indentation + "<\(tag.description)> \(text) </\(tag.description)>"
    }
}
