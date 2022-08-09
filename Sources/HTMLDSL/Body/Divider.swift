//
//  Divider.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

public struct Divider: HTMLBodyContentView {
    public var body: String

    public let newLine: NewLine = .none

    public let tag: Tag = .selfClosing(.hr)
    public var attributes = [Attribute]()

    public init() {
        self.body = ""
    }
}
