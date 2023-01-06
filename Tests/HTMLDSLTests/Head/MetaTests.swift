//
//  MetaTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 14/11/20.
//

import XCTest
@testable import HTMLDSL

class MetaTests: XCTestCase {
    func testMetaWithCharacterSet() {
        let document = Document {
            HTML {
                Head {
                    Meta(.characterSet(.utf8))
                }

                Body {
                    Headings("My Heading", type: .h1)
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
        </head>
        <body>
            <h1> My Heading </h1>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }

    func testMetaWithName() {
        let document = Document {
            HTML {
                Head {
                    Meta(.name(.author, content: "John Doe"))
                }

                Body {
                    Headings("My Heading", type: .h1)
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html>
        <head>
            <meta name="author" content="John Doe">
        </head>
        <body>
            <h1> My Heading </h1>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }

    func testMetaWithViewport() {
        let document = Document {
            HTML {
                Head {
                    Meta(.viewport(width: .deviceWidth, scale: .full))
                }

                Body {
                    Headings("My Heading", type: .h1)
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>
        <body>
            <h1> My Heading </h1>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }

    func testAllMeta() {
        let document = Document {
            HTML {
                Head {
                    Meta(.characterSet(.utf8))
                    Meta(.name(.author, content: "John Doe"))
                    Meta(.viewport(width: .deviceWidth, scale: .full))
                }

                Body {
                    Headings("My Heading", type: .h1)
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <meta name="author" content="John Doe">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>
        <body>
            <h1> My Heading </h1>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }
}
