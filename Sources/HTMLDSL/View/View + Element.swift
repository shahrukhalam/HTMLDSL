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
            let isEmptyNewLine = newLine == .none
            let bodyElement: String = isEmptyNewLine ? (" " + body.element + " ") : (newLine.rawValue + body.element)

            let lineSpace = newLine.rawValue

            textElement = "<\(tag.description)\(finalAttribute)>\(bodyElement)\(lineSpace)</\(tag.description)>"
        case .selfClosing:
            let isEmptyNewLine = newLine == .none
            let bodyElement: String = isEmptyNewLine ? (" " + body.element) : (newLine.rawValue + body.element)
            textElement = "<\(tag.description)\(bodyElement)\(finalAttribute)>"
        case .empty:
            textElement = "\(body.element)"
        case .all:
            fatalError("Not for Views")
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
