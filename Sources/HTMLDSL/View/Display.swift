//
//  Display.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 26/12/20.
//

import Foundation

/// CSS display Property: https://www.w3schools.com/cssref/pr_class_display.asp
/// CSS Default Values Reference: https://www.w3schools.com/cssref/css_default_values.php
public enum Display: String {
    case inline
    case block
    case grid
    
    case flex
    case inlineFlex = "inline-flex"

    case inlineBlock = "inline-block"
    case none
    case initial
    case inherit
}
