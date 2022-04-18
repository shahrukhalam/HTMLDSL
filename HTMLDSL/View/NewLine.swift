//
//  NewLine.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/04/2022.
//

enum NewLine: String {
    case none = ""
    case one = "\n"
}

extension View {
    var newLine: NewLine { .one }
}
