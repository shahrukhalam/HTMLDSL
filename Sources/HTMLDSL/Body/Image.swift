//
//  Image.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public struct Image: HTMLBodyImageContentView {
    public var body: String
    public let newLine: NewLine = .none
    public let tag = Tag.selfClosing(.image)
    public var attributes = [Attribute]()

    public init(_ source: String, alternateText: String) {
        self.body = "src=\"\(source)\" alt=\"\(alternateText)\""
    }
}
