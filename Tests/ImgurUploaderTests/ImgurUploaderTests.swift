import XCTest
@testable import ImgurUploader

final class ImgurUploaderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ImgurUploader().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
