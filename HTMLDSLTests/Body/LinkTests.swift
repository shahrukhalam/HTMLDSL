//
//  LinkTests.swift
//  HTMLDSLTests
//
//  Created by Shahrukh Alam on 18/11/20.
//

import XCTest
@testable import HTMLDSL

class LinkTests: XCTestCase {
    func testLink() {
        let link = Link(text: "Google", url: "https://www.google.com")

        let expectation =
        """
        <a href="https://www.google.com">Google</a>
        """

        XCTAssertEqual(link.element, expectation)
    }

    func testLinkWithTarget() {
        let link = Link(text: "Google", url: "https://www.google.com").target(.newWindowOrTab)

        let expectation =
        """
        <a href="https://www.google.com" target="_blank">Google</a>
        """

        XCTAssertEqual(link.element, expectation)
    }
}
