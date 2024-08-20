//
//  ParagraphTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 14/11/20.
//

import XCTest
@testable import HTMLDSL

class ParagraphTests: XCTestCase {
    func testParagraph() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    Paragraphs("Nora Fatehi")
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
        <p>Nora Fatehi</p>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }
}
