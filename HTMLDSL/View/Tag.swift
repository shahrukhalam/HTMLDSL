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
            return tag.description
        case .selfClosing(let tag):
            return tag.rawValue
        case .empty:
            return ""
        }
    }
}

enum EnclosingTag: CustomStringConvertible {
    case html
    case head
    case body

    // Head Content Tags
    case title

    // Body Content Tags
    case headings(HeadingTag)

    var description: String {
        switch self {
        case .html:
            return "html"
        case .head:
            return "head"
        case .body:
            return "body"
        case .title:
            return "title"
        case .headings(let tag):
            return tag.rawValue
        }
    }
}

enum SelfClosingTag: String {
    case document = "!DOCTYPE html"
}