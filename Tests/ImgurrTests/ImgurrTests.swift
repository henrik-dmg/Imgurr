import XCTest
import HPNetwork
@testable import ImgurrCore

class ImgurrTests: XCTestCase {

    func testUpload() throws {
        let fileURL = URL(fileURLWithPath: "~/Pictures/Wallpapers/jolanda-van der meer-daKQZ8M6T9g.jpg")

        let handler = ImgurHandler()
        _ = try handler.uploadImage(at: fileURL)
    }

}


struct EmptyWrapper: Codable {

}
