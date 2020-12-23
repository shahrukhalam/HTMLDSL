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

        switch tag {
        case .enclosing:
            return "<\(tag.description)\(finalAttribute)>\n\(body.element)\n</\(tag.description)>"
        case .selfClosing:
            return "<\(tag.description)\(finalAttribute)>\n\(body.element)"
        case .empty:
            preconditionFailure("It's an EmptyView: shouldn't be used")
        }
    }
}
