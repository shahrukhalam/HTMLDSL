//
//  ModifiedContentTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 16/11/20.
//

import XCTest
@testable import HTMLDSL

class ModifiedContentTests: XCTestCase {
    func testImageWithBackgroundColor() {
        let image = Image("Images/nora.jpg", alternateText: "Nora Fatehi")
            .backgroundColor(.red)

        let expectation =
        """
        <img src="Images/nora.jpg" alt="Nora Fatehi" style="background-color:red;">
        """

        XCTAssertTrue(image is ModifiedContent<Image, BackgroundColorModifier<Image>>)
        XCTAssertEqual(image.element, expectation)
    }

    func testImageWithMultipleBackgroundColor() {
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
}
