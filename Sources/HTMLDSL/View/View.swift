//
//  HTMLView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

public protocol View {
    associatedtype Body: View
    var body: Body { get }

    var newLine: NewLine { get }
    var tag: Tag { get }
    var attributes: [Attribute] { get set }
    var element: String { get }
}

public extension View {
    var newLine: NewLine { .none }
    var tag: Tag { .empty }
}
