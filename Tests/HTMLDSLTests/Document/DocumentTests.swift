//
//  HTMLDSLTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 14/11/20.
//

import XCTest
@testable import HTMLDSL

class DocumentTests: XCTestCase {
    func testInitialDocument() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    Headings("My Heading", type: .h1)
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title>My Website</title>
        </head>
        <body>
        <h1>My Heading</h1>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }

    func testInitialDocumentIndentation() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    Div {
                        Headings("My Heading1", type: .h1)
                        Div {
                            Headings("My Heading2", type: .h1)
                        }
                    }
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title>My Website</title>
        </head>
        <body>
        <div>
        <h1>My Heading1</h1>
        <div>
        <h1>My Heading2</h1>
        </div>
        </div>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }
}
