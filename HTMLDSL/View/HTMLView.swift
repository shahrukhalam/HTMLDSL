//
//  HTMLView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

/// Content for `Document`
/// eg: `HTML`
protocol HTMLView: View {  }
/// Content for `HTML`
/// eg: `Head`, `Body`
protocol HTMLContentView: HTMLView {  }

/// ``HTMLContentView`` for `Head`
protocol HTMLHeadView: HTMLContentView {  }
/// Content for `Head`
/// eg: `Meta`, `Title`
protocol HTMLHeadContentView: HTMLHeadView {  }
/// Texts in `Head`
protocol HTMLHeadTextContentView: HTMLHeadContentView {
    var text: String { get }
}

/// ``HTMLContentView`` for `Body`
protocol HTMLBodyView: HTMLContentView {  }
/// Content for `Body`
/// eg: `Headings`, `Paragraph`
protocol HTMLBodyContentView: HTMLBodyView {  }
/// Texts in `Body`
protocol HTMLBodyTextContentView: HTMLBodyContentView {
    var text: String { get }
}
/// Images in `Body`
protocol HTMLBodyImageContentView: HTMLBodyContentView {  }
/// Links in `Body`
protocol HTMLBodyLinkContentView: HTMLBodyContentView {
    var url: String { get }
}
