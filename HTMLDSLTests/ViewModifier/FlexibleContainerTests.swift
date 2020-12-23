//
//  FlexibleContainerTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 23/12/20.
//

import XCTest
@testable import HTMLDSL

class FlexibleContainerTests: XCTestCase {
    func testFlexibleHeading() {
        let flexibleHeadings = FlexibleContainer {
            Headings("Nora Fatehi")
        }

        let expectation =
            """
        <h1 class="flex-container"> Nora Fatehi </h1>
        """

        XCTAssertEqual(flexibleHeadings.element, expectation)
    }

    func testFlexibleHeadingWithID() {
        let flexibleHeadings = FlexibleContainer {
            Headings("Nora Fatehi")
                .identifyBy(id: "Nora")
        }

        let expectation =
            """
        <h1 id="Nora" class="flex-container"> Nora Fatehi </h1>
        """

        XCTAssertEqual(flexibleHeadings.element, expectation)
    }
}
