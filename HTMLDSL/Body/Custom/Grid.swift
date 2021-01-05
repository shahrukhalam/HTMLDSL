//
//  Grid.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 05/01/21.
//

import Foundation

struct Grid: HTMLBodyContentView {
    let tag = Tag.empty
    var attributes = [Attribute]()

    private let details: [Detail]

    init(details: [Detail]) {
        self.details = details
    }

    var body: some HTMLBodyContentView {
        let gridViews = details.map { detail -> AnyView in
            let gridView = Div {
                Div {
                    Headings(detail.title)
                        .identifyBy(cssClass: .heroHeading)
                    Headings(detail.subtitle)
                        .identifyBy(cssClass: .gridSubHeading)
                }
                .identifyBy(cssClass: .centeredText)
            }
            .identifyBy(cssClass: .gridImage)

            return AnyView(gridView)
        }

        let grid =  Div { AnyView(gridViews) }
            .identifyBy(cssClass: .gridContainer)

        return grid
    }
}
