//
//  SizeModifierTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 16/11/20.
//

import XCTest
@testable import HTMLDSL

class SizeModifierTests: XCTestCase {
    func testModifiedContentWithNoWidthOrHeight() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .size()

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi">
        """

        XCTAssertEqual(image.element, expectation)
    }

    func testModifiedContentWithWidthNoHeight() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .size(width: .percentage(100))

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="width: 100%;">
        """

        XCTAssertEqual(image.element, expectation)
    }

    func testModifiedContentWithHeightNoWidth() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .size(height: .percentage(100))

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="height: 100%;">
        """

        XCTAssertEqual(image.element, expectation)
    }

    func testModifiedContentWithHeightAndWidth() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .size(width: .pixel(100), height: .auto)

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="width: 100.0px;height: auto;">
        """

        XCTAssertEqual(image.element, expectation)
    }
}
