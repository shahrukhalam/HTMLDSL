//
//  Attribute.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

public enum Attribute: CustomStringConvertible, Equatable {
    case language(String)

    public typealias HTMLID = String
    case id(HTMLID)

    case style([Style])
    case `class`([CSSClass])

    // Link
    case href(String)
    case target(Target)
    case accessibility(String)
    
    // Script
    case source(String)

    public var description: String {
        switch self {
        case .language(let language):
            return "lang=\"\(language)\""
        case .id(let id):
            return "id=\"\(id)\""
        case .style(let styles):
            let finalStyle = styles.map { $0.description }.joined()
            return "style=\"\(finalStyle)\""
        case .class(let cssClasses):
            let classes = cssClasses.map { $0.value }.joined(separator: " ")
            if classes.isEmpty { return "" }
            return "class=\"\(classes)\""
        case .href(let url):
            return "href=\"\(url)\""
        case .target(let target):
            return "target=\"\(target.rawValue)\""
        case .accessibility(let text):
            return "aria-label=\"\(text)\""
        case .source(let url):
            return "src=\"\(url)\""
        }
    }

    public static func == (lhs: Attribute, rhs: Attribute) -> Bool {
        switch (lhs, rhs) {
        case (.language, .language):
            return true
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
        case (.accessibility, .accessibility):
            return true
        case (.source, .source):
            return true
        default:
            return false
        }
    }
}
