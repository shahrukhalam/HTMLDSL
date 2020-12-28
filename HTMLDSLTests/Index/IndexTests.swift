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
                        HeroImageStyle(url: "Images/Hero.png", heightInPixel: 745)
                        CenteredTextStyle(topInPixel: 76)
                        HeroHeadingStyle(color: .html(.White))
                        HeroSubHeadingStyle(color: .html(.White))
                        GridContainerStyle()
                        GridImageStyle(url: "Images/nora.jpg", heightInPixel: 720)
                        GridSubHeadingStyle(color: .html(.White))
                        StackViewStyle(alignment: .center, distribution: .center)
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
                            Div {
                                Image("Images/app store.png", alternateText: "App Store Icon")
                                    .size(width: .pixel(40), height: .pixel(40))
                                Headings("Featured")
                                    .identifyBy(cssClass: .heroHeading)
                                    .padding(left: .pixel(10))
                                    .margin()
                            }
                            .identifyBy(cssClass: .flexibleContainerHorizontal)

                            Headings("Paytm Money Trading App")
                                .identifyBy(cssClass: .heroSubHeading)
                                .padding(top: .pixel(16))
                                .margin()
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
        color:rgba(60, 60, 60, 1.0);
        }
        a:hover {
        color:Black;
        }
        .heroImage {
        background-image: url("Images/Hero.png");
        background-color:rgba(250, 250, 250, 1.0);
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
        background-image: url("Images/nora.jpg");
        background-color:rgba(250, 250, 250, 1.0);
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
        .flexibleContainerHorizontal {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
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
        <div class="flexibleContainerHorizontal">
        <img src="Images/app store.png" alt="App Store Icon" style="width:40px;height:40px;">
        <h1 class="heroHeading" style="padding: 0px 0px 0px 10px;margin: 0px 0px 0px 0px;"> Featured </h1>
        </div>
        <h1 class="heroSubHeading" style="padding: 16px 0px 0px 0px;margin: 0px 0px 0px 0px;"> Paytm Money Trading App </h1>
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
