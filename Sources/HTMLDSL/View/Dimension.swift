//
//  AutoDimension.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

public enum AutoDimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case auto

    public var description: String {
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

public enum InheritDimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case inherit

    public var description: String {
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

public enum AutoInheritDimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case auto
    case inherit

    public var description: String {
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

public enum AutoInheritInitialDimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case auto
    case inherit
    case initial

    public var description: String {
        switch self {
        case .percentage(let value):
            return "\(value)%"
        case .pixel(let value):
            return "\(value)px"
        case .auto:
            return "auto"
        case .inherit:
            return "inherit"
        case .initial:
            return "initial"
        }
    }
}

public enum BoxSizing: String {
    case contentBox = "content-box"
    case borderBox = "border-box"
    case initial
    case inherit
}
