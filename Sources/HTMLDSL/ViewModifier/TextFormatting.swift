//
//  TextFormatting.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 17/11/20.
//

import Foundation

extension String {
    private enum Tag: String {
        case bold = "b"
        case markImportant = "strong"
        case italic = "i"
        case code
        case emphasize = "em"
        case highlight = "mark"
        case small = "small"
        case delete = "del"
        case underline = "u"
        case insert = "ins"
        case `subscript` = "sub"
        case superscript = "sup"
    }

    public var bold: Self {
        "<\(Tag.bold.rawValue)>\(self)</\(Tag.bold.rawValue)>"
    }

    var markImportant: Self {
        "<\(Tag.markImportant.rawValue)>\(self)</\(Tag.markImportant.rawValue)>"
    }

    public var italic: Self {
        "<\(Tag.italic.rawValue)>\(self)</\(Tag.italic.rawValue)>"
    }

    public func code(cssClass: CSSClass) -> Self {
        "<\(Tag.code.rawValue) class=\"\(cssClass.value)\">\(self)</\(Tag.code.rawValue)>"
    }

    var emphasize: Self {
        "<\(Tag.emphasize.rawValue)>\(self)</\(Tag.emphasize.rawValue)>"
    }

    var highlight: Self {
        "<\(Tag.highlight.rawValue)>\(self)</\(Tag.highlight.rawValue)>"
    }

    var small: Self {
        "<\(Tag.small.rawValue)>\(self)</\(Tag.small.rawValue)>"
    }

    public var delete: Self {
        "<\(Tag.delete.rawValue)>\(self)</\(Tag.delete.rawValue)>"
    }

    public var underline: Self {
        "<\(Tag.underline.rawValue)>\(self)</\(Tag.underline.rawValue)>"
    }

    var insert: Self {
        "<\(Tag.insert.rawValue)>\(self)</\(Tag.insert.rawValue)>"
    }

    var `subscript`: Self {
        "<\(Tag.subscript.rawValue)>\(self)</\(Tag.subscript.rawValue)>"
    }

    var superscript: Self {
        "<\(Tag.superscript.rawValue)>\(self)</\(Tag.superscript.rawValue)>"
    }
}
