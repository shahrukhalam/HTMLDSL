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
        background-color:Yellow;
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
        background-color:Yellow;
        }
        h1 {
        background-color:Red;
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
        background-color:Yellow;
        }
        .flex-container {
        background-color:Red;
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
        background-color:Yellow;
        margin: 15px 15px 15px 15px;
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
        background-color:Yellow;
        margin: 15px 15px 15px 15px;
        width:15px;
        height:15px;
        }
        </style>
        </head>
        """

        XCTAssertEqual(head.element, expectation)
    }

    func testIndexNavStyle() {
        let indexNavStyle = IndexNavStyle()

        let expectation =
            """
        .indexNav {
        position: fixed;
        left: auto;
        top: 0px;
        right: 0px;
        bottom: 0px;
        background-color:rgba(240, 240, 240, 0.8);
        text-align:center;
        -webkit-backdrop-filter: saturate(180%) blur(20px);
        backdrop-filter: saturate(180%) blur(20px);
        }
        .indexNav a {
        padding: 16px 16px 16px 16px;
        color:Black;
        display: inline-block;
        text-decoration: none;
        }
        """

        XCTAssertEqual(indexNavStyle.element, expectation)
    }
}
