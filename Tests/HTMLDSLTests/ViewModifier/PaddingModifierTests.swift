//
//  PaddingModifierTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 24/12/20.
//

import XCTest
@testable import HTMLDSL

class PaddingModifierTests: XCTestCase {
    func testHeadingWithUniformPadding() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .padding(left: .pixel(10), top: .pixel(10), right: .pixel(10), bottom: .pixel(10))

        let expectation =
        """
        <h1 style="padding: 10.0px 10.0px 10.0px 10.0px;"> Nora Fatehi </h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }

    func testHeadingWithUniformMarginAndPadding() {
        let headings = Headings("Nora Fatehi", type: .h1)
            .margin(left: .pixel(10), top: .pixel(10), right: .pixel(10), bottom: .pixel(10))
            .padding(left: .pixel(10), top: .pixel(10), right: .pixel(10), bottom: .pixel(10))

        let expectation =
        """
        <h1 style="margin: 10.0px 10.0px 10.0px 10.0px;padding: 10.0px 10.0px 10.0px 10.0px;"> Nora Fatehi </h1>
        """

        XCTAssertEqual(headings.element, expectation)
    }
}
