//
//  Attribute.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

enum Attribute: CustomStringConvertible, Equatable {
    typealias HTMLID = String

    case id(HTMLID)

    case style([Style])
    case `class`(CSSClass)

    // Link
    case target(Target)

    var description: String {
        switch self {
        case .id(let id):
            return "id=\"\(id)\""
        case .style(let styles):
            let finalStyle = styles.map { $0.description }.joined()
            return "style=\"\(finalStyle)\""
        case .class(let cssClass):
            if case .empty = cssClass { return "" }
            return "class=\"\(cssClass.description)\""
        case .target(let target):
            return "target=\"\(target.rawValue)\""
        }
    }

    static func == (lhs: Attribute, rhs: Attribute) -> Bool {
        switch (lhs, rhs) {
        case (.id, .id):
            return true
        case (.style, .style):
            return true
        case (.class, .class):
            return true
        case (.target, .target):
            return true
        default:
            return false
        }
    }
}
