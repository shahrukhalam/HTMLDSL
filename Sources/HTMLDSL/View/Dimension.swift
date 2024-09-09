//
//  AutoDimension.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

public enum AutoDimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Float)
    case auto
    case number(Float)
    case fullViewPortHeight
    case fullViewPortWidth
    case percentageViewPortHeight(Int)
    case percentageViewPortWidth(Int)

    public var description: String {
        switch self {
        case .percentage(let value):
            return "\(value)%"
        case .pixel(let value):
            return "\(value)px"
        case .auto:
            return "auto"
        case .number(let value):
            return "\(value)"
        case .fullViewPortHeight:
            return "100vh"
        case .fullViewPortWidth:
            return "100vw"
        case .percentageViewPortHeight(let value):
            return "\(value)vh"
        case .percentageViewPortWidth(let value):
            return "\(value)vw"
        }
    }
}

public enum InheritDimension: CustomStringConvertible {
    case percentage(Int)
    case pixel(Int)
    case inherit
    case number(Float)

    public var description: String {
        switch self {
        case .percentage(let value):
            return "\(value)%"
        case .pixel(let value):
            return "\(value)px"
        case .inherit:
            return "inherit"
        case .number(let value):
            return "\(value)"
        }
    }
}

public enum Length: CustomStringConvertible {
    case relativeToRoot(Float)
    case relativeToParent(Float)

    public var description: String {
        switch self {
        case .relativeToRoot(let value):
            return "\(value)rem"
        case .relativeToParent(let value):
            return "\(value)em"
        }
    }
}

public enum AutoInheritDimension: CustomStringConvertible {
    case percentage(Float)
    case pixel(Float)
    case auto
    case inherit
    case length(Length)

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
        case .length(let value):
            return value.description
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
