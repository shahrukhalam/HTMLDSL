//
//  View + Never.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

extension Never: View {
    typealias Body = Never
}

/// EmptyView: Acts as a Dummy View for Compiler, shouldn't be used
struct EmptyView: View {
    typealias Body = Never
}

extension View where Self.Body == Never {
    var body: Body {
        preconditionFailure("It's a Never: Doesn't have a real body")
    }
}
