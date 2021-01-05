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
                    Meta([.characterSet(.utf8),
                          .name(.author, content: "Shahrukh Alam")])
                    HeadStyle {
                        IndexBodyStyle()
                        IndexNavStyle()
                        HeroImageStyle(heightInPixel: 745)
                        CenteredTextStyle(topInPixel: 76)
                        HeroHeadingStyle(color: .html(.White))
                        HeroSubHeadingStyle(color: .html(.White))
                        GridContainerStyle()
                        GridImageStyle(heightInPixel: 800)
                        GridSubHeadingStyle(color: .html(.White))
                    }
                }

                Body {
                    Div {
                        Link(text: "Home", url: "index.html").identifyBy(cssClass: .activeLink)
                        Link(text: "About", url: "about.html").identifyBy(cssClass: .inactiveLink)
                    }
                    .identifyBy(cssClass: .indexNav)

                    Hero(detail: Detail(title: "Featured", subtitle: "Paytm Money Trading App", image: ""))

                    Grid(details: [Detail(title: "Hola!", subtitle: "This is Shahrukh Alam", image: ""),
                                   Detail(title: "Hola!", subtitle: "This is Shahrukh Alam", image: "")])
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
        <style>
        body {
        margin: 0px 0px 0px 0px;
        font-family:SF Pro Display, SF Pro Icons, Helvetica Neue, Helvetica, Arial;
        }
        .indexNav {
        position: fixed;
        left: 0px;
        top: 0px;
        right: 0px;
        bottom: auto;
        background-color:rgba(240, 240, 240, 0.8);
        text-align:center;
        -webkit-backdrop-filter: saturate(180%) blur(20px);
        backdrop-filter: saturate(180%) blur(20px);
        }
        .indexNav a {
        padding: 16px 16px 16px 16px;
        display: inline-block;
        text-decoration: none;
        }
        .activeLink {
        color:Black;
        }
        .inactiveLink {
        color:rgba(60, 60, 60, 1.0);
        }
        a:hover {
        color:Black;
        }
        .heroImage {
        background-color:rgba(250, 250, 250, 1.0);
        height:745px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
        }
        .centeredText {
        text-align:center;
        position: absolute;
        left: 50%;
        top: 76px;
        right: auto;
        bottom: auto;
        transform: translate(-50%, 0%);
        }
        .heroHeading {
        font-size:44px;
        font-weight:600;
        color:White;
        }
        .heroSubHeading {
        font-size:40px;
        font-weight:400;
        color:White;
        }
        .gridContainer {
        padding: 12px 12px 12px 12px;
        display: grid;
        grid-template-columns: auto auto;
        grid-column-gap: 12px;
        background-color:rgba(250, 250, 250, 1.0);
        }
        .gridImage {
        background-color:rgba(250, 250, 250, 1.0);
        height:800px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
        }
        .gridSubHeading {
        font-size:19px;
        font-weight:400;
        color:White;
        }
        </style>
        </head>
        <body>
        <div class="indexNav">
        <a href="index.html" class="activeLink">Home</a>
        <a href="about.html" class="inactiveLink">About</a>
        </div>
        <div class="heroImage">
        <div class="centeredText">
        <h1 class="heroHeading"> Featured </h1>
        <h1 class="heroSubHeading"> Paytm Money Trading App </h1>
        </div>
        </div>
        <div class="gridContainer">
        <div class="gridImage">
        <div class="centeredText">
        <h1 class="heroHeading"> Hola! </h1>
        <h1 class="gridSubHeading"> This is Shahrukh Alam </h1>
        </div>
        </div>
        <div class="gridImage">
        <div class="centeredText">
        <h1 class="heroHeading"> Hola! </h1>
        <h1 class="gridSubHeading"> This is Shahrukh Alam </h1>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        XCTAssertEqual(index.element, expectation)
    }
}
