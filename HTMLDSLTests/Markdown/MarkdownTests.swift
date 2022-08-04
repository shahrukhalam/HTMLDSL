//
//  MarkdownTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 04/08/22.
//

import XCTest
@testable import HTMLDSL

class MarkdownTests: XCTestCase {
    func testMarkdown() {
        let markdown = Markdown("Hello")
        
        let expectation =
        """
            <div>
                Hello
            </div>
        """
        
        XCTAssertEqual(markdown.element, expectation)
    }
    
    func testMarkdownDiv() {
        let markdownDiv = Div {
            Link(text: "Home", url: "index.html")
                .identifyBy(cssClass: .activeLink)
            Markdown("Hello")
        }
        
        let expectation =
        """
            <div>
                <a href="index.html" class="activeLink">
                Home
                </a>
                <div>
                    Hello
                </div>
            </div>
        """
        
        XCTAssertEqual(markdownDiv.element, expectation)
    }
    
    func testMarkdownDocument() {
        let markdownDocument = Document {
            HTML {
                Head {
                    Title("Wonder Woman")
                }
                Body {
                    Div {
                        Link(text: "Home", url: "index.html")
                            .identifyBy(cssClass: .activeLink)
                        Markdown("Hello")
                    }
                }
            }
        }
        
        let expectation =
        """
        <!DOCTYPE html>
        <html>
        <head>
            <title> Wonder Woman </title>
        </head>
        <body>
            <div>
                <a href="index.html" class="activeLink">
                Home
                </a>
                <div>
                    Hello
                </div>
            </div>
        </body>
        </html>
        """
        
        XCTAssertEqual(markdownDocument.element, expectation)
    }
}
