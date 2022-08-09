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
            <a href="https://www.google.com">
            Google
            </a>
        """

        XCTAssertEqual(link.element, expectation)
    }

    func testLinkWithTarget() {
        let link = Link(text: "Google", url: "https://www.google.com").target(.newWindowOrTab)

        let expectation =
        """
            <a href="https://www.google.com" target="_blank">
            Google
            </a>
        """

        XCTAssertEqual(link.element, expectation)
    }

    func testLinkWithImage() {
        let link = ImageLink(url: "https://www.google.com") {
            Image("google.jpg", alternateText: "Google")
        }

        let expectation =
        """
            <a href="https://www.google.com">
                <img src="google.jpg" alt="Google">
            </a>
        """

        XCTAssertEqual(link.element, expectation)
    }

    func testLinkWithImageAndTarget() {
        let link = ImageLink(url: "https://www.google.com") {
            Image("google.jpg", alternateText: "Google")
        }
        .target(.newWindowOrTab)

        let expectation =
        """
            <a href="https://www.google.com" target="_blank">
                <img src="google.jpg" alt="Google">
            </a>
        """

        XCTAssertEqual(link.element, expectation)
    }

    func testLinkWithImage_Style_AndTarget() {
        let link = ImageLink(url: "https://www.google.com") {
            Image("google.jpg", alternateText: "Google")
                .size(width: .pixel(42), height: .pixel(42))
        }
        .target(.newWindowOrTab)

        let expectation =
        """
            <a href="https://www.google.com" target="_blank">
                <img src="google.jpg" alt="Google" style="width: 42px;height: 42px;">
            </a>
        """

        XCTAssertEqual(link.element, expectation)
    }
}
