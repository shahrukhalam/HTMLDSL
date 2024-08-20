//
//  DivTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 24/12/20.
//

import XCTest
@testable import HTMLDSL

class DivTests: XCTestCase {
    func testDivWithHeading() {
        let div = Div {
            Headings("Nora Fatehi", type: .h1)
        }

        let expectation =
        """
        <div>
        <h1>Nora Fatehi</h1>
        </div>
        """

        XCTAssertEqual(div.element, expectation)
    }
}
