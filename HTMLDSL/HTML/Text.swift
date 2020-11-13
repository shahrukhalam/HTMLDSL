//
//  Text.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

struct Text: HTMLBodyContentView, HTMLHeadContentView {
    typealias Body = Never

    private let text: String

    init(_ text: String) {
        self.text = text
    }
}
