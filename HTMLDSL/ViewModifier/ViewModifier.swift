//
//  Modifier.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

protocol ViewModifier {
    associatedtype Body: View
    associatedtype Content: View
    func body(content: Self.Content) -> Self.Body
}
