//
//  Hero.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 05/01/21.
//

import Foundation

struct Detail {
    let title: String
    let subtitle: String
    let image: String
}

struct Hero: HTMLBodyContentView {
    let tag = Tag.empty
    var attributes = [Attribute]()

    private let detail: Detail

    init(detail: Detail) {
        self.detail = detail
    }

    var body: some HTMLBodyContentView {
        Div {
            Div {
                Headings(detail.title, type: .h1)
                    .identifyBy(cssClass: .heroHeading)

                Headings(detail.subtitle, type: .h2)
                    .identifyBy(cssClass: .heroSubHeading)
            }
            .identifyBy(cssClass: .centeredText)
        }
        .identifyBy(cssClass: .heroImage)
        .backgroundImage(path: detail.image)
    }
}
