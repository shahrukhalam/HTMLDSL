//
//  FontSize.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

enum FontSize: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case relativeToDefaultFontSize(Float)
    case relativeToViewportWidth(Int)

    var description: String {
        switch self {
        case .percentage(let value):
            return "\(value)%"
        case .pixel(let value):
            return "\(value)px"
        case .relativeToDefaultFontSize(let value):
            return "\(value)em"
        case .relativeToViewportWidth(let value):
            return "\(value)vw"
        }
    }
}

enum FontWeight: CustomStringConvertible {
    case normal
    case bold
    case bolder
    case lighter
    case number(Int)
    case initial
    case inherit

    var description: String {
        switch self {
        case .normal:
            return "normal"
        case .bold:
            return "bold"
        case .bolder:
            return "bolder"
        case .lighter:
            return "lighter"
        case .number(let number):
            return "\(number)"
        case .initial:
            return "initial"
        case .inherit:
            return "inherit"
        }
    }
}
