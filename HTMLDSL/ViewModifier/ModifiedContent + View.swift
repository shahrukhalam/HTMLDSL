//
//  ModifiedContent + View.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

extension ModifiedContent: View, HTMLView, HTMLContentView, HTMLBodyView, HTMLBodyContentView
where Modifier: ViewModifier, Modifier.Content == Content {
    typealias Body = Never
    var tag: Tag { .empty }
    
    init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
        
        let newContent = modifier.body(content: content)
        self.attributes = newContent.attributes
    }
    
    var element: String {
        var newContent = content
        newContent.attributes = attributes
        return newContent.element
    }
}

extension ModifiedContent: HTMLBodyTextContentView
where Modifier: ViewModifier, Modifier.Content == Content, Content: HTMLBodyTextContentView {
    var text: String { content.text }
}

extension ModifiedContent: HTMLBodyImageContentView
where Modifier: ViewModifier, Modifier.Content == Content, Content: HTMLBodyImageContentView {  }

extension ModifiedContent: HTMLBodyLinkContentView
where Modifier: ViewModifier, Modifier.Content == Content, Content: HTMLBodyLinkContentView {  }
