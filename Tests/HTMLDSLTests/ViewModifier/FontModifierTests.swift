//
//  FontModifierTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 17/11/20.
//

import XCTest
@testable import HTMLDSL

class FontModifierTests: XCTestCase {
    func testHeadingWithBackgroundColorForegroundColorAndNoFont() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .backgroundColor(.html(.Green))
            .foregroundColor(.html(.Blue))
            .font()

        let expectation =
        """
        <h1 style="background-color: Green;color: Blue;">Nora Fatehi</h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testHeadingWithFontSizeNoFamily() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .font(size: .percentage(100))

        let expectation =
        """
        <h1 style="font-size: 100%;">Nora Fatehi</h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testHeadingWithFontFamilyNoSize() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .font(family: .serif([.TimesNewRoman, .Times, .serif]))

        let expectation =
        """
        <h1 style="font-family: Times New Roman, Times, serif;">Nora Fatehi</h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testHeadingWithFontSizeAndFamily() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .font(size: .percentage(100), family: .serif([.TimesNewRoman, .Times, .serif]))

        let expectation =
        """
        <h1 style="font-size: 100%;font-family: Times New Roman, Times, serif;">Nora Fatehi</h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testHeadingWithFontSize_Family_AndAlignment() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .font(size: .percentage(100), family: .serif([.TimesNewRoman, .Times, .serif]))
            .align(.justify)

        let expectation =
        """
        <h1 style="font-size: 100%;font-family: Times New Roman, Times, serif;text-align: justify;">Nora Fatehi</h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }
}
