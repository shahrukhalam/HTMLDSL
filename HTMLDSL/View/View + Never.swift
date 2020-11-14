//
//  View + Never.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

extension Never: View {
    typealias Body = Never
    var tag: Tag { fatalError("It's a Never: Doesn't have a real Tag") }
}

extension View where Self.Body == Never {
    var body: Body {
        fatalError("It's a Never: Doesn't have a real Body")
    }
}
