//
//  Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

public protocol ViewModifier {
    associatedtype Body: View
    typealias Content = Body
    func body(content: Self.Content) -> Self.Body
}
