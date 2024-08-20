//
//  ModifiedContentTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 16/11/20.
//

import XCTest
@testable import HTMLDSL

class ModifiedContentTests: XCTestCase {
    func testHeadingWithID() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .identifyBy(id: "Nora")

        let expectation =
        """
        <h1 id="Nora">Nora Fatehi</h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testHeadingWithEmptyClass() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .identifyBy(cssClass: .empty)

        let expectation =
        """
        <h1>Nora Fatehi</h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testHeadingWithClass() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .identifyBy(cssClass: .flexibleContainer)

        let expectation =
        """
        <h1 class="flex-container">Nora Fatehi</h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testModifiedContentWithSingleBackgroundColor() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .backgroundColor(.html(.Red))

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color: Red;">
        """

        XCTAssertEqual(image.element, expectation)
    }

    func testModifiedContent_Types_Attributes_Elements() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
        let redImage = image.backgroundColor(.html(.Red))
        let greenImage = redImage.backgroundColor(.html(.Green))

        let redExpectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color: Red;">
        """

        let greenExpectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color: Green;">
        """

        XCTAssertEqual(redImage.attributes, [.style([.backgroundColor(.html(.Red))])])
        XCTAssertEqual(greenImage.attributes, [Attribute.style([.backgroundColor(.html(.Green))])])

        XCTAssertEqual(redImage.element, redExpectation)
        XCTAssertEqual(greenImage.element, greenExpectation)
    }

    func testModifiedContentWithMultipleBackgroundColor() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .backgroundColor(.html(.Red))
            .backgroundColor(.html(.Green))
            .backgroundColor(.html(.Blue))

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color: Blue;">
        """

        XCTAssertEqual(image.element, expectation)
    }

    func testHeadingWithBackgroundColorAndForegroundColor() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .backgroundColor(.html(.Green))
            .foregroundColor(.html(.Blue))

        let expectation =
        """
        <h1 style="background-color: Green;color: Blue;">Nora Fatehi</h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testParagraphWithBackgroundColorAndForegroundColor() {
        let headings = Paragraphs("Nora Fatehi")
            .backgroundColor(.html(.Green))
            .foregroundColor(.html(.Blue))

        let expectation =
        """
        <p style="background-color: Green;color: Blue;">Nora Fatehi</p>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testParagraphWithBackgroundColor_ForegroundColorAndID() {
        let headings = Paragraphs("Nora Fatehi")
            .backgroundColor(.html(.Green))
            .foregroundColor(.html(.Blue))
            .identifyBy(id: "Nora")

        let expectation =
        """
        <p style="background-color: Green;color: Blue;" id="Nora">Nora Fatehi</p>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testParagraphWithBackgroundColor_ForegroundColorAndClass() {
        let headings = Paragraphs("Nora Fatehi")
            .backgroundColor(.html(.Green))
            .foregroundColor(.html(.Blue))
            .identifyBy(cssClass: .flexibleContainer)

        let expectation =
        """
        <p style="background-color: Green;color: Blue;" class="flex-container">Nora Fatehi</p>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testParagraphWithBackgroundColor_ForegroundColor_IDAndClass() {
        let headings = Paragraphs("Nora Fatehi")
            .backgroundColor(.html(.Green))
            .foregroundColor(.html(.Blue))
            .identifyBy(id: "Nora")
            .identifyBy(cssClass: .flexibleContainer)

        let expectation =
        """
        <p style="background-color: Green;color: Blue;" id="Nora" class="flex-container">Nora Fatehi</p>
        """

        XCTAssertEqual(headings.element, expectation)
    }
}
