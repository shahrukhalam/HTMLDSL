//
//  Image.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

/// HTML `Image` element
///
/// - Note: Default `display` property of **Image** is `inline`.
/// So, make sure to change it to `block` when wrapped in a **Div**, if you want to have like full width image.
/// Ref: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#styling_with_css
///
public struct Image: HTMLBodyImageContentView {
    public var body: String
    public let newLine: NewLine = .none
    public let tag = Tag.selfClosing(.image)
    public var attributes = [Attribute]()

    public init(_ source: String, alternateText: String) {
        self.body = "src=\"\(source)\" alt=\"\(alternateText)\""
    }
}
