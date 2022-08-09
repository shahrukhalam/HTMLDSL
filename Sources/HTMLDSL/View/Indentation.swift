//
//  Indentation.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 12/04/2022.
//

public enum Indentation: Int {
    case none = 0
    case tab = 4
}

public extension View {
    var indentation: Indentation { .tab }
}
