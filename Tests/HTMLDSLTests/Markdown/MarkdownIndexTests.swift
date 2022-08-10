//
//  MarkdownIndexTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 04/08/22.
//

import XCTest
@testable import HTMLDSL

class MarkdownIndexTests: XCTestCase {
    func testMarkdownIndexHTML() {
        let markdown =
        """
        # HTMLDSL

        ## What is a DSL:
        It stands for Domain Specific Language.

        Purpose: DSL solves a particular problem for everyone even for the ones with very little knowledge on a particular domain.

        If you are an Apple Developer, then you would probably know about `Podfile` which is a DSL written in Ruby.

        Here we are trying to build one for HTML in Pure Swift which we all love.
        """
        
        let index = Document {
            HTML {
                Head {
                    Title("Wonder Woman")
                    Meta([.characterSet(.utf8),
                          .name(.author, content: "Shahrukh Alam")])
                    CSSLink(path: "CSS/Common/nav.css")
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

                    Markdown(markdown)
                }
            }
        }

        let expectation =
            """
        <!DOCTYPE html>
        <html>
        <head>
            <title> Wonder Woman </title>
            <meta charset="UTF-8" name="author" content="Shahrukh Alam">
            <link rel="stylesheet" href="CSS/Common/nav.css">
            <style>
            body {
            margin: 0px 0px 0px 0px;
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
            <div>
                <h1>HTMLDSL</h1>
                <h2>What is a DSL:</h2>
                <p>It stands for Domain Specific Language.</p>
                <p>Purpose: DSL solves a particular problem for everyone even for the ones with very little knowledge on a particular domain.</p>
                <p>If you are an Apple Developer, then you would probably know about <code>Podfile</code> which is a DSL written in Ruby.</p>
                <p>Here we are trying to build one for HTML in Pure Swift which we all love.</p>
            </div>
        </body>
        </html>
        """

        XCTAssertEqual(index.element, expectation)
    }
}
