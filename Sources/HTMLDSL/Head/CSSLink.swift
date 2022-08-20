//
//  CSSLink.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 05/01/21.
//

import Foundation

public struct CSSLink: HTMLHeadContentView {
    public let body: String

    public let newLine: NewLine = .none
    public let tag = Tag.selfClosing(.link)

    public var attributes: [Attribute] = []

    private let path: String

    public init(path: String) {
        self.path = path
        self.body = "rel=\"stylesheet\" href=\"\(path)\""
    }
}

public extension CSSLink {
    enum DeviceType: String {
        case small = "screen and (max-width: 900px)"
        case wide = "screen and (min-width: 900px)"
    }
    
    init(path: String, type: DeviceType) {
        self.path = path
        self.body = "rel=\"stylesheet\" media=\"\(type.rawValue)\" href=\"\(path)\""
    }
}

public extension CSSLink {
    init(favicon path: String) {
        self.path = path
        self.body = "rel=\"icon\" type=\"image/png\" href=\"\(path)\""
    }
}
