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
        let handler = ImgurHandler()

        let newResponses = try images.map {
            try handler.uploadImage(at: $0)
        }

        let urls = newResponses.map {
            $0.data.link.absoluteString
        }.joined(separator: "\n")
        print(urls)
    }

    private func saveResponses(responses: [ImgurResponse], output: URL) throws {
        let existingResponses = try fetchExistingResponses(at: output)
        let allResponses = (existingResponses + responses).sorted { $0.data.date < $1.data.date }

        let data = try JSONEncoder().encode(allResponses)
        try data.hp_write(to: output)
    }

    private func fetchExistingResponses(at url: URL) throws -> [ImgurResponse] {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([ImgurResponse].self, from: data)
    }

}
