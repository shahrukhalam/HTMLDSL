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
        guard !attributes.isEmpty else {
            return "<\(tag.description)>"
        }

        let finalAttributes = attributes.map { $0.description }.joined(separator: " ")
        return "<\(tag.description) \(finalAttributes)>"
    }
}

public extension Meta {
    enum MetaAttributes: CustomStringConvertible {
        case characterSet(CharacterSet)
        case name(Name, content: String)
        case property(Property, content: String)
        case twitter(Twitter, content: String)
        case viewport(width: Width, scale: Scale, maxScale: Scale? = nil, isUserInteractionDisabled: Bool = false)

        public var description: String {
            switch self {
            case .characterSet(let characterSet):
                return "charset=\"\(characterSet.rawValue)\""
            case .name(let name, let content):
                return "name=\"\(name.rawValue)\" content=\"\(content)\""
            case .property(let proprty, let content):
                return "property=\"\(proprty.rawValue)\" content=\"\(content)\""
            case .twitter(let name, let content):
                return "name=\"\(name.rawValue)\" content=\"\(content)\""
            case let .viewport(width, scale, maxScale, isUserInteractionDisabled):
                var content = "width=\(width.rawValue), initial-scale=\(scale.rawValue)"
                if let maxScale = maxScale {
                    content += ", maximum-scale=\(scale.rawValue)"
                }
                if isUserInteractionDisabled {
                    content += ", user-scalable=no"
                }
                
                return "name=\"viewport\" content=\"\(content)\""
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
    }
    
    enum Property: String {
        case type = "og:type"
        case title = "og:title"
        case description = "og:description"
        case image = "og:image"
        case url = "og:url"
    }
    
    enum Twitter: String {
        case title = "twitter:title"
        case description = "twitter:description"
        case image = "twitter:image"
        case url = "twitter:url"
        case card = "twitter:card"
    }

    enum Width: String {
        case deviceWidth = "device-width"
    }

    enum Scale: String {
        case full = "1.0"
    }
}
