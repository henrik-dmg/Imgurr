import ArgumentParser
import Foundation
import ImgurrCore

struct Delete: ParsableCommand {

    static let configuration: CommandConfiguration = CommandConfiguration(
        commandName: "delete",
        abstract: "Deletes the images at the specified URLs",
        discussion: "Please note that if an image was not uploaded with imgurr, it is currently not possible to delete that image directly",
        helpNames: .shortAndLong)

    @Argument()
    var urls: [String]

    func run() throws {
        let uploader = try ImgurHandler()

        let mappedURLs = urls.compactMap { URL(string: $0) }

        try mappedURLs.forEach {
            try uploader.deleteImage(url: $0)
        }
    }

}
