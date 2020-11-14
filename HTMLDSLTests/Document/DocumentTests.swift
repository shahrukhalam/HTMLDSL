//
//  HTMLDSLTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 14/11/20.
//

import XCTest
@testable import HTMLDSL

class DocumentTests: XCTestCase {
    func testInitalDocument() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    Headings("My Heading")
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html>
        <head>
        <title> My Website </title>
        </head>
        <body>
        <h1> My Heading </h1>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }
}
