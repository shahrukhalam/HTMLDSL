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
                    Title("My Website")
                    Meta([.characterSet(.utf8),
                          .name(.author, content: "Shahrukh Alam")])
                    HeadStyle {
                        TagStyle(for: .enclosing(.body))
                            .margin(uniform: .pixel(16))
                            .font(family: .sansSerif([.SFProDisplay,
                                                      .SFProIcons,
                                                      .HelveticaNeue,
                                                      .Helvetica,
                                                      .Arial]))
                    }
                }

                Body {
                    Div {
                        Link(text: "Home", url: "")
                        Link(text: "About", url: "")
                    }
                    .identifyBy(cssClass: .indexNav)

                    Headings("Shahrukh Alam")
                        .identifyBy(cssClass: .indexIntro)
                }
            }
        }

        let expectation =
            """
        <!DOCTYPE html>
        <html>
        <head>
        <title> My Website </title>
        <meta charset="UTF-8" name="author" content="Shahrukh Alam">
        <style>
        body {
        margin: 16px 16px 16px 16px;
        font-family:SF Pro Display, SF Pro Icons, Helvetica Neue, Helvetica, Arial;
        }
        </style>
        </head>
        <body>
        <div class="indexNav">
        <a href="">Home</a>
        <a href="">About</a>
        </div>
        <h1 class="indexIntro"> Shahrukh Alam </h1>
        </body>
        </html>
        """

        XCTAssertEqual(index.element, expectation)
    }
}
