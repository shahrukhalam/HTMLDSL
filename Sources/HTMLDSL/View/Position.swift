//
//  Position.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 26/12/20.
//

import Foundation

// https://www.w3schools.com/css/css_positioning.asp
public enum Position: String {
    case `static`
    case absolute
    case fixed
    case relative
    case sticky
    case initial
    case inherit
}

public enum BackgroundPosition: String {
    case center
    case initial
    case inherit
}

public enum BackgroundRepeat: String {
    case `repeat`
    case noRepeat = "no-repeat"
    case initial
    case inherit
}

public enum BackgroundSize: CustomStringConvertible {
    case auto
    case pixel(x: Int, y: Int)
    case percentage(x: Int, y: Int)
    case percentages(Int)
    case cover
    case contain
    case initial
    case inherit

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case let .pixel(x, y):
            return "\(x)px \(y)px"
        case let .percentage(x, y):
            return "\(x)% \(y)%"
        case .percentages(let value):
            return "\(value)%"
        case .cover:
            return "cover"
        case .contain:
            return "contain"
        case .initial:
            return "initial"
        case .inherit:
            return "inherit"
        }
    }
}

public enum Transform: CustomStringConvertible {
    case translate(X: AutoDimension, Y: AutoDimension)

    public var description: String {
        switch self {
        case let .translate(X, Y):
            return "translate(\(X.description), \(Y.description))"
        }
    }
}
