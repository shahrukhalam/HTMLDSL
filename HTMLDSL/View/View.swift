//
//  HTMLView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

protocol View {
    associatedtype Body: View
    var body: Body { get }

    var indentation: Indentation { get }
    var newLine: NewLine { get }
    var tag: Tag { get }
    var attributes: [Attribute] { get set }
    var element: String { get }
}

enum NewLine: String {
    case none = ""
    case one = "\n"
}

extension View {
    var newLine: NewLine { .one }
}
