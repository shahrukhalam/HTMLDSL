//
//  NewLine.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/04/2022.
//

public enum NewLine: String {
    case none = ""
    case one = "\n"
}

public extension View {
    var newLine: NewLine { .one }
}
