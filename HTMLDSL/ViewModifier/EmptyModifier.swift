//
//  EmptyModifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

struct EmptyModifier: ViewModifier {
    typealias Body = Never

    func body(content: Content) -> Body {  }
}
