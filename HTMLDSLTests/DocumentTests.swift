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
                    Text("Head Text")
                }

                Body {
                    Text("Body Text")
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html>
        <head>
        <h1> Head Text </h1>
        </head>
        <body>
        <h1> Body Text </h1>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }
}
