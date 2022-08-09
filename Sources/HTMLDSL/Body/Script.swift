//
//  Script.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import Foundation

public struct Script: HTMLBodyContentView {
    public var body: String = ""
    public let newLine: NewLine = .none
    public let tag = Tag.enclosing(.script)
    public var attributes = [Attribute]()

    public init(url: String) {
        self.attributes = [.source(url)]
    }
    
    public init(command: String) {
        self.body = command
    }
}
