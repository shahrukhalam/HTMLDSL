//
//  Indentation.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 12/04/2022.
//

enum Indentation: Int {
    case none = 0
    case tab = 4
}

extension View {
    var indentation: Indentation { .tab }
}
