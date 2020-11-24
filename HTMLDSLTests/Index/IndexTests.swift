//
//  IndexTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 24/11/20.
//

import XCTest
@testable import HTMLDSL

class IndexTests: XCTestCase {
    func testIndexHTML() {
        let description =
            """
        (born 6 February 1992) is a Canadian dancer, model, actress, and singer who is best known for her work in the Indian film industry. She has appeared in Hindi, Telugu, Malayalam and Tamil language films.
        She made her film debut in the Bollywood film Roar: Tigers of the Sundarbans. She gained popularity in Telugu cinema by doing item numbers in films like Temper, Baahubali: The Beginning and Kick 2 and has also starred in two Malayalam films, Double Barrel and Kayamkulam Kochunni.
        """

        let index = Document {
            HTML {
                Head {
                    Title("My Website")
                    Meta([.characterSet(.utf8),
                          .name(.author, content: "Shahrukh Alam")])
                }

                Body {
                    Headings("Nora Fatehi")
                        .foregroundColor(.DeepPink)
                        .font(size: .relativeToViewportWidth(4))
                    Paragraphs("Nora Fatehi ".bold + description)
                        .backgroundColor(.GhostWhite)
                        .font(size: .percentage(125),
                              family: .monospace([.CourierNew, .Courier, .monospace]))
                        .align(.justify)
                    Image("Images/nora.jpg", alternateText: "Nora Fatehi")
                        .size(width: .percentage(30))
                    Link(text: "Nora Fatehi Instagram Handle",
                         url: "https://www.instagram.com/norafatehi/?hl=en")
                        .target(.newWindowOrTab)
                }
            }
        }

        let expectation =
            """
        <!DOCTYPE html>
        <html>
        <head>
        <title> My Website </title>
        <meta charset="UTF-8" name="author" content="Shahrukh Alam">
        </head>
        <body>
        <h1 style="color:DeepPink;font-size:4vw;"> Nora Fatehi </h1>
        <p style="background-color:GhostWhite;font-size:125%;font-family:Courier New, Courier, monospace;text-align:justify;"> <b>Nora Fatehi </b>\(description) </p>
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="width:30%;">
        <a href="https://www.instagram.com/norafatehi/?hl=en" target="_blank">Nora Fatehi Instagram Handle</a>
        </body>
        </html>
        """

        XCTAssertEqual(index.element, expectation)
    }
}
