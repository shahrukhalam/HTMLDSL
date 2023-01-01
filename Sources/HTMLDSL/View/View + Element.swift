//
//  View + Element.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

extension View {
    public var element: String {
        let allAttributes = attributes.map { $0.description }.joined(separator: " ")
        let isEmptyAttribute = attributes.isEmpty || allAttributes.isEmpty
        let finalAttribute = isEmptyAttribute ? "" : " " + allAttributes

        let element: String
        switch tag {
        case .enclosing:
            let isEmptyNewLine = newLine == .none
            let bodyElement: String = isEmptyNewLine ? (" " + body.element + " ") : (newLine.rawValue + body.element)

            let lineSpace = newLine.rawValue

            element = "<\(tag.description)\(finalAttribute)>\(bodyElement)\(lineSpace)</\(tag.description)>"
        case .selfClosing:
            let isEmptyNewLine = newLine == .none
            let bodyElementSameLine = body.element.isEmpty ? "" : " " + body.element
            let bodyElement: String = isEmptyNewLine ? bodyElementSameLine : (newLine.rawValue + body.element)
            element = "<\(tag.description)\(bodyElement)\(finalAttribute)>"
        case .empty:
            element = "\(body.element)"
        }

        return element
    }
}
