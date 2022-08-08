//
//  EmptyView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

/// EmptyView: Acts as a Dummy View for Compiler, shouldn't be used
struct EmptyView: HTMLContentView {
    typealias Body = Never
    let tag = Tag.empty
}
