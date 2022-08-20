//
//  Meta.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public struct Meta: HTMLHeadContentView {
    public typealias Body = Never

    public let newLine: NewLine = .none
    public let tag = Tag.selfClosing(.meta)

    private let attributes: [MetaAttributes]

    public init(_ attributes: MetaAttributes) {
        self.attributes = [attributes]
    }

    public var element: String {
        let spaceCount: Int = indentation.rawValue
        let spaces = Array(repeating: " ", count: spaceCount).joined(separator: "")

        guard !attributes.isEmpty else {
            return spaces + "<\(tag.description)>"
        }

        let finalAttributes = attributes.map { $0.description }.joined(separator: " ")
        return spaces + "<\(tag.description) \(finalAttributes)>"
    }
}

public extension Meta {
    enum MetaAttributes: CustomStringConvertible {
        case characterSet(CharacterSet)
        case name(Name, content: String)
        case property(Property, content: String)
        case viewport(width: Width, scale: Scale)

        public var description: String {
            switch self {
            case .characterSet(let characterSet):
                return "charset=\"\(characterSet.rawValue)\""
            case .name(let name, let content):
                return "name=\"\(name.rawValue)\" content=\"\(content)\""
            case .property(let proprty, let content):
                return "proprty=\"\(proprty.rawValue)\" content=\"\(content)\""
            case .viewport(let width, let scale):
                return "name=\"viewport\" content=\"width=\(width.rawValue), initial-scale=\(scale.rawValue)\""
            }
        }
    }

    enum CharacterSet: String {
        case utf8 = "UTF-8"
    }

    enum Name: String {
        case keywords
        case description
        case author
        case twitter = "twitter:card"
    }
    
    enum Property: String {
        case title = "og:title"
        case description = "og:description"
        case image = "og:image"
        case url = "og:url"
    }

    enum Width: String {
        case deviceWidth = "device-width"
    }

    enum Scale: String {
        case full = "1.0"
    }
}
