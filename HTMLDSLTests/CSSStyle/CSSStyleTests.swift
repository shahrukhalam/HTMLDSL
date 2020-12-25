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
                ClassStyle(for: .empty)
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
                    .backgroundColor(.Yellow)
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
                    .backgroundColor(.Yellow)
                TagStyle(for: .enclosing(.headings(.h1)))
                    .backgroundColor(.Red)
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
                    .backgroundColor(.Yellow)
                ClassStyle(for: .flexibleContainer)
                    .backgroundColor(.Red)
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
}
