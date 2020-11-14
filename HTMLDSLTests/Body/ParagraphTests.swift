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
                    Paragraphs("Nora Fatehi (born 6 February 1992[2][3]) is a Canadian dancer, model, actress, and singer who is best known for her work in the Indian film industry. She has appeared in Hindi, Telugu, and Malayalam language films. She made her film debut in the Bollywood film Roar: Tigers of the Sundarbans.[4][5] She gained popularity in Telugu cinema by doing item numbers in films like Temper, Baahubali: The Beginning and Kick 2 and has also starred in two Malayalam films, Double Barrel and Kayamkulam Kochunni.")
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
        <p> Nora Fatehi (born 6 February 1992[2][3]) is a Canadian dancer, model, actress, and singer who is best known for her work in the Indian film industry. She has appeared in Hindi, Telugu, and Malayalam language films. She made her film debut in the Bollywood film Roar: Tigers of the Sundarbans.[4][5] She gained popularity in Telugu cinema by doing item numbers in films like Temper, Baahubali: The Beginning and Kick 2 and has also starred in two Malayalam films, Double Barrel and Kayamkulam Kochunni. </p>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }
}
