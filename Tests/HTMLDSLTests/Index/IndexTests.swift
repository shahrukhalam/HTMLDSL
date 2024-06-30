//
//  IndexTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 24/11/20.
//

import XCTest
@testable import HTMLDSL

class IndexTests: XCTestCase {
    func testIndexHTML() {
        let index = Document {
            HTML {
                Head {
                    Title("Wonder Woman")
                    Meta(.characterSet(.utf8))
                    Meta(.name(.author, content: "Shahrukh Alam"))
                    CSSLink(path: "CSS/Common/nav.css")
                    CSSLink(path: "CSS/Index/hero.css")
                    CSSLink(path: "CSS/Index/grid.css")
                    HeadStyle {
                        IndexBodyStyle()
                    }
                }

                Body {
                    Div {
                        Link(text: "Home", url: "index.html")
                            .identifyBy(cssClass: .activeLink)
                        Link(text: "About", url: "about.html")
                            .identifyBy(cssClass: .inactiveLink)
                    }
                    .identifyBy(cssClass: .indexNav)

                    Hero(detail: Detail(title: "Gal Galot",
                                        subtitle: "Diana Prince or Wonder Woman",
                                        image: "Images/wonder1.jpg"))

                    Grid(details: [Detail(title: "Wonder Woman",
                                          subtitle: "Amazons, Themyscira & Ares",
                                          image: "Images/wonder2.jpg"),
                                   Detail(title: "Wonder Woman 1984",
                                          subtitle: "I wish to be You",
                                          image: "Images/wonder3.jpeg")])
                }
            }
        }

        let expectation =
            """
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title> Wonder Woman </title>
        <meta charset="UTF-8">
        <meta name="author" content="Shahrukh Alam">
        <link rel="stylesheet" href="CSS/Common/nav.css">
        <link rel="stylesheet" href="CSS/Index/hero.css">
        <link rel="stylesheet" href="CSS/Index/grid.css">
        <style>
        body {
        margin: 0.0px 0.0px 0.0px 0.0px;
        font-family: SF Pro Display, SF Pro Icons, Helvetica Neue, Helvetica, Arial;
        }
        </style>
        </head>
        <body>
        <div class="indexNav">
        <a href="index.html" class="activeLink">
        Home
        </a>
        <a href="about.html" class="inactiveLink">
        About
        </a>
        </div>
        <div class="heroImage" style="background-image: url(Images/wonder1.jpg);background-position: inherit;background-size: inherit;background-repeat: inherit;">
        <div class="centeredText">
        <h1 class="heroHeading"> Gal Galot </h1>
        <h2 class="heroSubHeading"> Diana Prince or Wonder Woman </h2>
        </div>
        </div>
        <div class="gridContainer">
        <div class="gridImage" style="background-image: url(Images/wonder2.jpg);background-position: inherit;background-size: inherit;background-repeat: inherit;">
        <div class="centeredText">
        <h2 class="heroHeading"> Wonder Woman </h2>
        <h3 class="gridSubHeading"> Amazons, Themyscira & Ares </h3>
        </div>
        </div>
        <div class="gridImage" style="background-image: url(Images/wonder3.jpeg);background-position: inherit;background-size: inherit;background-repeat: inherit;">
        <div class="centeredText">
        <h2 class="heroHeading"> Wonder Woman 1984 </h2>
        <h3 class="gridSubHeading"> I wish to be You </h3>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        XCTAssertEqual(index.element, expectation)
    }
}
