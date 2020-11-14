//
//  ImageTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 14/11/20.
//

import XCTest
@testable import HTMLDSL

class ImageTests: XCTestCase {
    func testHeadingWithImage() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    Headings("Nora Fatehi")
                    Image("/images/nora.jpg", alternateText: "Nora Fatehi")
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
        <img src="/images/nora.jpg" alt="Nora Fatehi">
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }
}
