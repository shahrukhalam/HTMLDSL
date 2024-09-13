//
//  EmptyView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

/// EmptyView: Acts as a Dummy View for Compiler, shouldn't be used
public struct EmptyView: HTMLContentView {
    public typealias Body = Never
    public let tag = Tag.empty
    public let element: String = ""

    public init() {  }
}
