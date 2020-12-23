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
        let headings = Headings("Nora Fatehi")
            .identifyBy(id: "Nora")

        let expectation =
        """
        <h1 id="Nora"> Nora Fatehi </h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testHeadingWithEmptyClass() {
        let headings = Headings("Nora Fatehi")
            .identifyBy(cssClass: .empty)

        let expectation =
        """
        <h1> Nora Fatehi </h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testHeadingWithClass() {
        let headings = Headings("Nora Fatehi")
            .identifyBy(cssClass: .flexibleContainer)

        let expectation =
        """
        <h1 class="flex-container"> Nora Fatehi </h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testModifiedContentWithSingleBackgroundColor() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .backgroundColor(.Red)

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color:Red;">
        """

        XCTAssertEqual(image.element, expectation)
    }

    func testModifiedContent_Types_Attributes_Elements() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
        let redImage = image.backgroundColor(.Red)
        let greenImage = redImage.backgroundColor(.Green)

        let redExpectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color:Red;">
        """

        let greenExpectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color:Green;">
        """

        XCTAssertTrue(redImage is ModifiedContent<Image, BackgroundColorModifier<Image>>)
        XCTAssertTrue(greenImage is ModifiedContent<ModifiedContent<Image, BackgroundColorModifier<Image>>, BackgroundColorModifier<ModifiedContent<Image, BackgroundColorModifier<Image>>>>)

        XCTAssertEqual(redImage.attributes, [.style([.backgroundColor(.Red)])])
        XCTAssertEqual(greenImage.attributes, [Attribute.style([.backgroundColor(.Green)])])

        XCTAssertEqual(redImage.element, redExpectation)
        XCTAssertEqual(greenImage.element, greenExpectation)
    }

    func testModifiedContentWithMultipleBackgroundColor() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .backgroundColor(.Red)
            .backgroundColor(.Green)
            .backgroundColor(.Blue)

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color:Blue;">
        """

        XCTAssertEqual(image.element, expectation)
    }

    func testHeadingWithBackgroundColorAndForegroundColor() {
        let headings = Headings("Nora Fatehi")
            .backgroundColor(.Green)
            .foregroundColor(.Blue)

        let expectation =
        """
        <h1 style="background-color:Green;color:Blue;"> Nora Fatehi </h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testParagraphWithBackgroundColorAndForegroundColor() {
        let headings = Paragraphs("Nora Fatehi")
            .backgroundColor(.Green)
            .foregroundColor(.Blue)

        let expectation =
        """
        <p style="background-color:Green;color:Blue;"> Nora Fatehi </p>
        """

        XCTAssertEqual(headings.element, expectation)
    }
}
