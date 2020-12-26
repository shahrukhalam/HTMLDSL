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
                        IndexBodyStyle()
                        IndexNavStyle()
                        HeroImageStyle(url: "Images/nora.jpg", heightInPixel: 745)
                        CenteredTextStyle(topInPixel: 50)
                        HeroHeadingStyle(color: .html(.White))
                        HeroSubHeadingStyle(color: .html(.White))
                        GridContainerStyle()
                        GridImageStyle(url: "Images/nora.jpg", heightInPixel: 720)
                        GridSubHeadingStyle(color: .html(.White))
                    }
                }

                Body {
                    Div {
                        Link(text: "Home", url: "").identifyBy(cssClass: .activeLink)
                        Link(text: "About", url: "About.html").identifyBy(cssClass: .inactiveLink)
                    }
                    .identifyBy(cssClass: .indexNav)

                    Div {
                        Div {
                            Headings("Hola!")
                                .identifyBy(cssClass: .heroHeading)
                            Headings("This is Shahrukh Alam")
                                .identifyBy(cssClass: .heroSubHeading)
                        }
                        .identifyBy(cssClass: .centeredText)
                    }
                    .identifyBy(cssClass: .heroImage)

                    Div {
                        Div {
                            Div {
                                Headings("Hola!")
                                    .identifyBy(cssClass: .heroHeading)
                                Headings("This is Shahrukh Alam")
                                    .identifyBy(cssClass: .gridSubHeading)
                            }
                            .identifyBy(cssClass: .centeredText)
                        }
                        .identifyBy(cssClass: .gridImage)

                        Div {
                            Div {
                                Headings("Hola!")
                                    .identifyBy(cssClass: .heroHeading)
                                Headings("This is Shahrukh Alam")
                                    .identifyBy(cssClass: .gridSubHeading)
                            }
                            .identifyBy(cssClass: .centeredText)
                        }
                        .identifyBy(cssClass: .gridImage)
                    }
                    .identifyBy(cssClass: .gridContainer)
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
        color:rgba(61, 61, 61, 1.0);
        }
        a:hover {
        color:Black;
        }
        .heroImage {
        background-image: url("Images/nora.jpg");
        background-color:rgba(240, 240, 240, 1.0);
        height:745px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
        z-index: -1;
        }
        .centeredText {
        text-align:center;
        position: absolute;
        left: 50%;
        top: 50px;
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
        background-color:rgba(240, 240, 240, 1.0);
        }
        .gridImage {
        background-image: url("Images/nora.jpg");
        background-color:rgba(240, 240, 240, 1.0);
        height:720px;
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
        <a href="" class="activeLink">Home</a>
        <a href="About.html" class="inactiveLink">About</a>
        </div>
        <div class="heroImage">
        <div class="centeredText">
        <h1 class="heroHeading"> Hola! </h1>
        <h1 class="heroSubHeading"> This is Shahrukh Alam </h1>
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
