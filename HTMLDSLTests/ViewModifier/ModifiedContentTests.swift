//
//  ModifiedContentTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 16/11/20.
//

import XCTest
@testable import HTMLDSL

class ModifiedContentTests: XCTestCase {
    func testModifiedContentWithSingleBackgroundColor() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .backgroundColor(.red)

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color:red;">
        """

        XCTAssertEqual(image.element, expectation)
    }

    func testModifiedContent_Types_Attributes_Elements() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
        let redImage = image.backgroundColor(.red)
        let greenImage = redImage.backgroundColor(.green)

        let redExpectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color:red;">
        """

        let greenExpectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color:green;">
        """

        XCTAssertTrue(redImage is ModifiedContent<Image, BackgroundColorModifier<Image>>)
        XCTAssertTrue(greenImage is ModifiedContent<ModifiedContent<Image, BackgroundColorModifier<Image>>, BackgroundColorModifier<ModifiedContent<Image, BackgroundColorModifier<Image>>>>)

        XCTAssertEqual(redImage.attributes, [.style([.backgroundColor(.red)])])
        XCTAssertEqual(greenImage.attributes, [Attribute.style([.backgroundColor(.green)])])

        XCTAssertEqual(redImage.element, redExpectation)
        XCTAssertEqual(greenImage.element, greenExpectation)
    }

    func testModifiedContentWithMultipleBackgroundColor() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .backgroundColor(.red)
            .backgroundColor(.green)
            .backgroundColor(.blue)

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color:blue;">
        """

        XCTAssertEqual(image.element, expectation)
    }

    func testHeadingWithBackgroundColorAndForegroundColor() {
        let headings = Headings("Nora Fatehi")
            .backgroundColor(.green)
            .foregroundColor(.blue)

        let expectation =
        """
        <h1 style="background-color:green;color:blue;"> Nora Fatehi </h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testParagraphWithBackgroundColorAndForegroundColor() {
        let headings = Paragraphs("Nora Fatehi")
            .backgroundColor(.green)
            .foregroundColor(.blue)

        let expectation =
        """
        <p style="background-color:green;color:blue;"> Nora Fatehi </p>
        """

        XCTAssertEqual(headings.element, expectation)
    }
}
