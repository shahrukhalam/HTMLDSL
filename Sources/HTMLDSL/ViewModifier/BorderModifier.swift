//
//  BorderModifier.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

public struct BorderModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView
    
    private let sides: [Side]
    private let width: AutoDimension
    private let color: Color
    
    public init(sides: [Side], width: AutoDimension, color: Color) {
        self.sides = sides
        self.width = width
        self.color = color
    }
    
    public func body(content: Content) -> Body {
        return update(content: content, for: .border(sides: [], width: .auto, color: .html(.Black)), with: .border(sides: sides, width: width, color: color))
    }
}

public struct CornerModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView
    
    private let dimensions: [AutoDimension]
    
    init(dimension: AutoDimension) {
        self.dimensions = [dimension]
    }
    
    init(dimensions: [AutoDimension]) {
        self.dimensions = dimensions
    }
    
    public func body(content: Content) -> Body {
        return update(content: content, for: .cornerRadius([.auto]), with: .cornerRadius(dimensions))
    }
}

public struct DisplayModifier<ContentView>: ViewModifier where ContentView: HTMLContentView {
    public typealias Body = ContentView
    
    private let display: Display
    
    init(display: Display) {
        self.display = display
    }
    
    public func body(content: Content) -> Body {
        return update(content: content, for: .display(.none), with: .display(display))
    }
}
