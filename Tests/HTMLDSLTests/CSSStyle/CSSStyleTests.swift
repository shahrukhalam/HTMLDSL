//
//  CSSStyleTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 25/12/20.
//

import XCTest
@testable import HTMLDSL

class CSSStyleTests: XCTestCase {
    func testHeadWithEmptyTagStyle() {
        let head = Head {
            HeadStyle {
                TagStyle(for: .empty)
            }
        }

        let expectation =
        """
        <head>
        <style>

        </style>
        </head>
        """

        XCTAssertEqual(head.element, expectation)
    }

    func testHeadWithEmptyClassStyle() {
        let head = Head {
            HeadStyle {
                ClassStyle(forClass: .empty)
            }
        }

        let expectation =
        """
        <head>
        <style>

        </style>
        </head>
        """

        XCTAssertEqual(head.element, expectation)
    }

    func testHeadWithBodyTagWithNoStyle() {
        let head = Head {
            HeadStyle {
                TagStyle(for: .enclosing(.body))
            }
        }

        let expectation =
        """
        <head>
        <style>
        body {

        }
        </style>
        </head>
        """

        XCTAssertEqual(head.element, expectation)
    }

    func testHeadWithBodyTagWithBackgroundColorStyle() {
        let head = Head {
            HeadStyle {
                TagStyle(for: .enclosing(.body))
                    .backgroundColor(.html(.Yellow))
            }
        }

        let expectation =
        """
        <head>
        <style>
        body {
        background-color: Yellow;
        }
        </style>
        </head>
        """

        XCTAssertEqual(head.element, expectation)
    }

    func testHeadWithBodyTag_HeadingTagWithBackgroundColorStyle() {
        let head = Head {
            HeadStyle {
                TagStyle(for: .enclosing(.body))
                    .backgroundColor(.html(.Yellow))
                TagStyle(for: .enclosing(.headings(.h1)))
                    .backgroundColor(.html(.Red))
            }
        }

        let expectation =
        """
        <head>
        <style>
        body {
        background-color: Yellow;
        }
        h1 {
        background-color: Red;
        }
        </style>
        </head>
        """

        XCTAssertEqual(head.element, expectation)
    }

    func testHeadWithBodyTag_FlexibleContainerClassWithBackgroundColorStyle() {
        let head = Head {
            HeadStyle {
                TagStyle(for: .enclosing(.body))
                    .backgroundColor(.html(.Yellow))
                ClassStyle(forClass: .flexibleContainer)
                    .backgroundColor(.html(.Red))
            }
        }

        let expectation =
        """
        <head>
        <style>
        body {
        background-color: Yellow;
        }
        .flex-container {
        background-color: Red;
        }
        </style>
        </head>
        """

        XCTAssertEqual(head.element, expectation)
    }

    func testHeadWithBodyTagMultipleStyle() {
        let head = Head {
            HeadStyle {
                TagStyle(for: .enclosing(.body))
                    .backgroundColor(.html(.Yellow))
                    .margin(uniform: .pixel(15))
            }
        }

        let expectation =
        """
        <head>
        <style>
        body {
        background-color: Yellow;
        margin: 15.0px 15.0px 15.0px 15.0px;
        }
        </style>
        </head>
        """

        XCTAssertEqual(head.element, expectation)
    }

    func testHeadWithFlexibleContainerClassMultipleStyle() {
        let head = Head {
            HeadStyle {
                ClassStyle(forClass: .flexibleContainer)
                    .backgroundColor(.html(.Yellow))
                    .margin(uniform: .pixel(15))
                    .size(width: .pixel(15), height: .pixel(15))
            }
        }

        let expectation =
        """
        <head>
        <style>
        .flex-container {
        background-color: Yellow;
        margin: 15.0px 15.0px 15.0px 15.0px;
        width: 15.0px;
        height: 15.0px;
        }
        </style>
        </head>
        """

        XCTAssertEqual(head.element, expectation)
    }

    func testIndexNavStyle() {
        let indexNavStyle = PageNavStyle()

        let expectation =
            """
        .indexNav {
        position: fixed;
        left: 0.0px;
        top: 0.0px;
        right: 0.0px;
        bottom: auto;
        background-color: rgba(240.0, 240.0, 240.0, 0.8);
        text-align: center;
        -webkit-backdrop-filter: saturate(180%) blur(20px);
        backdrop-filter: saturate(180%) blur(20px);
        z-index: 1;
        }
        .indexNav a {
        padding: 16.0px 16.0px 16.0px 16.0px;
        display: inline-block;
        text-decoration: none;
        }
        .activeLink {
        color: Black;
        }
        .inactiveLink {
        color: rgba(60.0, 60.0, 60.0, 1.0);
        }
        link:hover {
        color: Black;
        }
        """

        XCTAssertEqual(indexNavStyle.element, expectation)
    }

    func testHeroImageStyle() {
        let indexNavStyle = HeroImageStyle(heightInPixel: 745)

        let expectation =
            """
        .heroImage {
        background-color: rgba(250.0, 250.0, 250.0, 1.0);
        height: 745.0px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        position: absolute;
        }
        """

        XCTAssertEqual(indexNavStyle.element, expectation)
    }

    func testCenteredTextStyle() {
        let style = CenteredTextStyle(topInPixel: 50)

        let expectation =
            """
        .centeredText {
        text-align: center;
        position: absolute;
        left: 50.0%;
        top: 50.0px;
        right: auto;
        bottom: auto;
        transform: translate(-50%, 0%);
        }
        """

        XCTAssertEqual(style.element, expectation)
    }

    func testHeroHeading() {
        let style = HeroHeadingStyle(color: .html(.White))

        let expectation =
            """
        .heroHeading {
        font-size: 44px;
        font-weight: 600;
        color: White;
        }
        """

        XCTAssertEqual(style.element, expectation)
    }

    func testHeroSubHeading() {
        let style = HeroSubHeadingStyle(color: .html(.White))

        let expectation =
            """
        .heroSubHeading {
        font-size: 40px;
        font-weight: 400;
        color: White;
        }
        """

        XCTAssertEqual(style.element, expectation)
    }

    func testGridContainerStle() {
        let style = GridContainerStyle()

        let expectation =
            """
        .gridContainer {
        padding: 12.0px 12.0px 12.0px 12.0px;
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        grid-column-gap: 12px;
        background-color: rgba(250.0, 250.0, 250.0, 1.0);
        }
        """

        XCTAssertEqual(style.element, expectation)
    }

    func testGridImageStle() {
        let style = GridImageStyle(heightInPixel: 720)

        let expectation =
            """
        .gridImage {
        background-color: rgba(250.0, 250.0, 250.0, 1.0);
        height: 720.0px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
        }
        """

        XCTAssertEqual(style.element, expectation)
    }

    func testGridSubHeading() {
        let style = GridSubHeadingStyle(color: .html(.White))

        let expectation =
            """
        .gridSubHeading {
        font-size: 19px;
        font-weight: 400;
        color: White;
        }
        """

        XCTAssertEqual(style.element, expectation)
    }
}
