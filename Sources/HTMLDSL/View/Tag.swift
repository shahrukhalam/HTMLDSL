//
//  Tag.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public enum Tag: CustomStringConvertible {
    case enclosing(EnclosingTag)
    case selfClosing(SelfClosingTag)
    case empty

    public var description: String {
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

public enum EnclosingTag: CustomStringConvertible {
    case html
    case head
    case body

    // Head Content Tags
    case title
    case style

    // Body Content Tags
    case headings(HeadingTag)
    case paragraph
    case link
    case div
    case iframe
    case script

    public var description: String {
        switch self {
        case .html:
            return "html"
        case .head:
            return "head"
        case .body:
            return "body"
        case .title:
            return "title"
        case .style:
            return "style"
        case .headings(let tag):
            return tag.rawValue
        case .paragraph:
            return "p"
        case .link:
            return "a"
        case .div:
            return "div"
        case .iframe:
            return "iframe"
        case .script:
            return "script"
        }
    }
}

public enum SelfClosingTag: String {
    case document = "!DOCTYPE html"

    // Head Content Tags
    case meta
    case link

    // Body Content Tags
    case image = "img"
    case hr
}
