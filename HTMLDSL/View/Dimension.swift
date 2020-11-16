//
//  Dimension.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

enum Dimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case auto

    var description: String {
        switch self {
        case .percentage(let value):
            return "\(value)%"
        case .pixel(let value):
            return "\(value)px"
        case .auto:
            return "auto"
        }
    }
}
