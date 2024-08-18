//
//  HTMLView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

/// Content for `Document`
/// eg: `HTML`
public protocol HTMLView: View {  }
/// Content for `HTML`
/// eg: `Head`, `Body`
public protocol HTMLContentView: HTMLView {  }

/// ``HTMLContentView`` for `Head`
public protocol HTMLHeadView: HTMLContentView {  }
/// Content for `Head`
/// eg: `Meta`, `Title`
public protocol HTMLHeadContentView: HTMLHeadView {  }
/// Texts in `Head`
public protocol HTMLHeadTextContentView: HTMLHeadContentView {
    var text: String { get }
}

/// ``HTMLContentView`` for `Body`
public protocol HTMLBodyView: HTMLContentView {  }
/// Content for `Body`
/// eg: `Headings`, `Paragraph`
public protocol HTMLBodyContentView: HTMLBodyView {  }
/// Texts in `Body`
public protocol HTMLBodyTextContentView: HTMLBodyContentView {
    var text: String { get }
}
/// Images in `Body`
/// eg: Image
public protocol HTMLBodyImageContentView: HTMLBodyContentView {  }
/// Links in `Body`
/// eg: Link
public protocol HTMLBodyLinkContentView: HTMLBodyContentView {
    var url: String { get }
}
/// List in `Body`
/// eg: OrderedList, UnorderedList
public protocol HTMLBodyListView: HTMLBodyContentView {  }
/// Item of List in `Body`
/// eg: ListItem
public protocol HTMLBodyListItemView: HTMLBodyContentView {  }
