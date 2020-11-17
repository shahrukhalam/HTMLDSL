//
//  Attribute.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

enum Attribute: CustomStringConvertible, Equatable {
    case style([Style])

    // Link
    case target(Target)

    var description: String {
        switch self {
        case .style(let styles):
            let finalStyle = styles.map { $0.description }.joined()
            return "style=\"\(finalStyle)\""
        case .target(let target):
            return "target=\"\(target.rawValue)\""
        }
    }
}
