//
//  View + Never.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

extension Never: View {
    public typealias Body = Never
    public var tag: Tag { fatalError("It's a Never: Doesn't have a real Tag") }
}

public extension View where Self.Body == Never {
    var body: Body {
        fatalError("It's a Never: Doesn't have a real Body")
    }

    var attributes: [Attribute] {
        get { [] }
        set { fatalError("It's a Never: Doesn't have any real Attributes") }
    }
}
