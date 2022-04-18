//
//  View + String.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 18/04/2022.
//

extension String: View {
    typealias Body = Never
    var tag: Tag { fatalError("It's a last element of the hierarchy: Doesn't have a real Tag") }
    var element: String { self }
}
