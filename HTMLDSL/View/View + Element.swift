//
//  View + Element.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

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
