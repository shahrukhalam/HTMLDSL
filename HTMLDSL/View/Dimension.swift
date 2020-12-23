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

enum MarginDimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case auto
    case inherit

    var description: String {
        switch self {
        case .percentage(let value):
            return "\(value)%"
        case .pixel(let value):
            return "\(value)px"
        case .auto:
            return "auto"
        case .inherit:
            return "inherit"
        }
    }
}

enum PaddingDimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case inherit

    var description: String {
        switch self {
        case .percentage(let value):
            return "\(value)%"
        case .pixel(let value):
            return "\(value)px"
        case .inherit:
            return "inherit"
        }
    }
}
