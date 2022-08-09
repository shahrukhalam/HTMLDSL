//
//  ModifiedContent + View.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

extension ModifiedContent: View, HTMLView, HTMLContentView, HTMLBodyView, HTMLBodyContentView
where Modifier: ViewModifier, Modifier.Content == Content {
    public typealias Body = Never
    public var tag: Tag { .empty }
    
    public init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
        
        let newContent = modifier.body(content: content)
        self.attributes = newContent.attributes
    }
    
    public var element: String {
        var newContent = content
        newContent.attributes = attributes
        return newContent.element
    }
}

extension ModifiedContent: HTMLBodyTextContentView
where Modifier: ViewModifier, Modifier.Content == Content, Content: HTMLBodyTextContentView {
    public var text: String { content.text }
}

extension ModifiedContent: HTMLBodyImageContentView
where Modifier: ViewModifier, Modifier.Content == Content, Content: HTMLBodyImageContentView {  }

extension ModifiedContent: HTMLBodyLinkContentView
where Modifier: ViewModifier, Modifier.Content == Content, Content: HTMLBodyLinkContentView {
    public var url: String { content.url }
}
