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
