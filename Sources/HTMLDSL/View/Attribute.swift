//
//  Attribute.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

public enum Attribute: CustomStringConvertible, Equatable {
    public typealias HTMLID = String

    case id(HTMLID)

    case style([Style])
    case `class`(CSSClass)

    // Link
    case href(String)
    case target(Target)
    
    // Script
    case source(String)

    public var description: String {
        switch self {
        case .id(let id):
            return "id=\"\(id)\""
        case .style(let styles):
            let finalStyle = styles.map { $0.description }.joined()
            return "style=\"\(finalStyle)\""
        case .class(let cssClass):
            if case .empty = cssClass { return "" }
            return "class=\"\(cssClass.rawValue)\""
        case .href(let url):
            return "href=\"\(url)\""
        case .target(let target):
            return "target=\"\(target.rawValue)\""
        case .source(let url):
            return "src=\"\(url)\""
        }
    }

    public static func == (lhs: Attribute, rhs: Attribute) -> Bool {
        switch (lhs, rhs) {
        case (.id, .id):
            return true
        case (.style, .style):
            return true
        case (.class, .class):
            return true
        case (.href, .href):
            return true
        case (.target, .target):
            return true
        case (.source, .source):
            return true
        default:
            return false
        }
    }
}
