//
//  Image.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Image: HTMLBodyImageContentView {
    var body: String
    let newLine: NewLine = .none
    let tag = Tag.selfClosing(.image)
    var attributes = [Attribute]()

    init(_ source: String, alternateText: String) {
        self.body = "src=\"\(source)\" alt=\"\(alternateText)\""
    }
}
