//
//  Target.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/11/20.
//

import Foundation

public enum Target: String, Equatable {
    case sameWindowOrTab = "_self"
    case newWindowOrTab = "_blank"
    case parentFrame = "_parent"
    case fullBodyOfTheWindow = "_top"
}
