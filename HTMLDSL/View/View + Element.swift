//
//  View + Element.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

extension View {
    var element: String {
        let allAttributes = attributes.map { $0.description }.joined(separator: " ")
        let isEmptyAttribute = attributes.isEmpty || allAttributes.isEmpty
        let finalAttribute = isEmptyAttribute ? "" : " " + allAttributes

        let textElement: String
        switch tag {
        case .enclosing:
            textElement = "<\(tag.description)\(finalAttribute)>\n\(body.element)\n</\(tag.description)>"
        case .selfClosing:
            textElement = "<\(tag.description)\(finalAttribute)>\n\(body.element)"
        case .empty:
            textElement = "\(body.element)"
        }

        let spaceCount: Int = indentation.rawValue
        let spaces = Array(repeating: " ", count: spaceCount).joined(separator: "")
        let element = textElement
            .split(separator: "\n")
            .map { spaces + $0 }
            .joined(separator: "\n")

        return element
    }
}
