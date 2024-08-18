import XCTest
@testable import HTMLDSL

class ListTests: XCTestCase {
    func test_basic_unordered_list() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    List(type: .unordered) {
                        ListItem("First Item")
                    }
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title> My Website </title>
        </head>
        <body>
        <ul>
        <li> First Item </li>
        </ul>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }

    func test_multiple_list_item_unordered_list_using_build_block() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    List(type: .unordered) {
                        ListItem("First Item")
                        ListItem("Second Item")
                    }
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title> My Website </title>
        </head>
        <body>
        <ul>
        <li> First Item </li>
        <li> Second Item </li>
        </ul>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }

    func test_multiple_list_item_unordered_list_using_build_array() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    List(type: .unordered) {
                        for text in ["First Item", "Second Item"] {
                            ListItem(text)
                        }
                    }
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title> My Website </title>
        </head>
        <body>
        <ul>
        <li> First Item </li>
        <li> Second Item </li>
        </ul>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }

    func test_basic_ordered_list() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    List(type: .ordered) {
                        ListItem("First Item")
                    }
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title> My Website </title>
        </head>
        <body>
        <ol>
        <li> First Item </li>
        </ol>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }

    func test_multiple_list_item_ordered_list_using_build_block() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    List(type: .ordered) {
                        ListItem("First Item")
                        ListItem("Second Item")
                    }
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title> My Website </title>
        </head>
        <body>
        <ol>
        <li> First Item </li>
        <li> Second Item </li>
        </ol>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }

    func test_multiple_list_item_ordered_list_using_build_array() {
        let document = Document {
            HTML {
                Head {
                    Title("My Website")
                }

                Body {
                    List(type: .ordered) {
                        for text in ["First Item", "Second Item"] {
                            ListItem(text)
                        }
                    }
                }
            }
        }

        let expectation =
        """
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title> My Website </title>
        </head>
        <body>
        <ol>
        <li> First Item </li>
        <li> Second Item </li>
        </ol>
        </body>
        </html>
        """

        XCTAssertEqual(document.element, expectation)
    }
}
