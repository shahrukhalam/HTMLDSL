//
//  HTMLView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

protocol HTMLView: View {  }
protocol HTMLContentView: HTMLView {  }

protocol HTMLHeadView: HTMLContentView {  }
protocol HTMLHeadContentView: HTMLHeadView {  }
protocol HTMLHeadTextContentView: HTMLHeadContentView {
    var text: String { get }
}

protocol HTMLBodyView: HTMLContentView {  }
protocol HTMLBodyContentView: HTMLBodyView {  }
protocol HTMLBodyTextContentView: HTMLBodyContentView {
    var text: String { get }
}
protocol HTMLBodyImageContentView: HTMLBodyContentView {  }
protocol HTMLBodyLinkContentView: HTMLBodyContentView {  }
