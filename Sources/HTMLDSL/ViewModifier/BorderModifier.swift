//
//  BorderModifier.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

public struct BorderModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView
    
    private let dimension: AutoDimension
    
    public init(dimension: AutoDimension) {
        self.dimension = dimension
    }
    
    public func body(content: Content) -> Body {
        return update(content: content, for: .borderWidth(.auto), with: .borderWidth(dimension))
    }
}

public struct CornerModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView
    
    private let dimension: AutoDimension
    
    init(dimension: AutoDimension) {
        self.dimension = dimension
    }
    
    public func body(content: Content) -> Body {
        return update(content: content, for: .cornerRadius(.auto), with: .cornerRadius(dimension))
    }
}
