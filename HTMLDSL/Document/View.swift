//
//  HTMLView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

protocol View {
    associatedtype Body: View
    var body: Body { get }

    var tag: Tag { get }
    var element: String { get }
}

extension View {
    var element: String {
        switch tag {
        case .enclosing:
            return "<\(tag.description)>\n\(body.element)\n</\(tag.description)>"
        case .selfClosing:
            return "<\(tag.description)>\n\(body.element)"
        case .empty:
            return "\(body.element)"
        }
    }
}

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
