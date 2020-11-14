//
//  Tag.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

enum Tag: CustomStringConvertible {
    case enclosing(EnclosingTag)
    case selfClosing(SelfClosingTag)
    case empty

    var description: String {
        switch self {
        case .enclosing(let tag):
            return tag.rawValue
        case .selfClosing(let tag):
            return tag.rawValue
        case .empty:
            return ""
        }
    }
}

enum EnclosingTag: String {
    case html
    case head
    case body

    // Body Content Tags
    case text = "h1"
}

enum SelfClosingTag: String {
    case document = "!DOCTYPE html"
}
