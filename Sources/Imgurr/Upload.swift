import ArgumentParser
import Foundation
import ImgurrCore

struct Upload: ParsableCommand {

    static let configuration: CommandConfiguration = CommandConfiguration(
        commandName: "upload",
        abstract: "Uploads the specified images to Imgur and returns the URLs",
        helpNames: .shortAndLong)

    @Argument()
    var images: [URL]

    func run() throws {
        let handler = try ImgurHandler()

        let newResponses = try images.map {
            try handler.uploadImage(at: $0)
        }

        let urls = newResponses.map {
            $0.data.link.absoluteString
        }.joined(separator: "\n")
        print(urls)
    }

}
