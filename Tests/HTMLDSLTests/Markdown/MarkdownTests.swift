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
                <p>Hello</p>
            </div>
        """
        
        XCTAssertEqual(markdown.element, expectation)
    }
    
    func testMarkdownTable() {
        let markdown = Markdown("""
        | Syntax      | Description |
        | ----------- | ----------- |
        | Header      | Title       |
        | Paragraph   | Text        |
        """)
        
        let expectation =
        """
        <div>
        <table>
        <thead>
        <tr>
        <th>Syntax</th>
        <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>Header</td>
        <td>Title</td>
        </tr>
        <tr>
        <td>Paragraph</td>
        <td>Text</td>
        </tr>
        </tbody>
        </table>
        
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
                    <p>Hello</p>
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
                    <p>Hello</p>
                </div>
            </div>
        </body>
        </html>
        """
        
        XCTAssertEqual(markdownDocument.element, expectation)
    }
}
