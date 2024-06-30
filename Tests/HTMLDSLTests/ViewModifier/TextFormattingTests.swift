//
//  TextFormattingTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 17/11/20.
//

import XCTest
@testable import HTMLDSL

class TextFormattingTests: XCTestCase {
    func testBold() {
        let paragraphs = Paragraphs("Nora Fatehi".bold)

        let expectation =
        """
        <p>
        <b>Nora Fatehi</b>
        </p>
        """

        XCTAssertEqual(paragraphs.element, expectation)
    }

    func testItalic() {
        let paragraphs = Paragraphs("Nora " + "Fatehi".italic)

        let expectation =
        """
        <p>
        Nora <i>Fatehi</i>
        </p>
        """

        XCTAssertEqual(paragraphs.element, expectation)
    }
}
