import XCTest
import HPNetwork
@testable import ImgurrCore

class ImgurrTests: XCTestCase {

    func testUpload() {
        let fileURL = URL(fileURLWithPath: "~/Pictures/Wallpapers/jolanda-van der meer-daKQZ8M6T9g.jpg")

        let clientID: String = "1d3041a440a4c66"

        let request = DecodableRequest<ImgurResponse>(
            urlString: "https://api.imgur.com/3/image",
            requestMethod: .post,
            authentication: .raw(string: "Client-ID \(clientID)"))

        let expectation = XCTestExpectation(description: "uploaded to imgur")

        Network.shared.uploadTask(request, fileURL: fileURL) { result in
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)
    }

}


struct EmptyWrapper: Codable {

}
