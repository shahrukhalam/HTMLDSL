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

    var tag: Tag { get }
    var element: String { get }
}
