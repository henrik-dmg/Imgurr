import CLIFoundation
import ArgumentParser
import Foundation

extension URL: ExpressibleByArgument {

    public init?(argument: String) {
        self.init(fileURLWithPath: argument)
    }

}

extension Data {

    /// Write the contents of the `Data` to a location and automatically creates any needed subdirectories.
    ///
    /// - parameter url: The location to write the data into.
    /// - parameter options: Options for writing the data. Default value is `[]`.
    /// - throws: An error in the Cocoa domain, if there is an error writing to the `URL`.
    func hp_write(to url: URL, options: Data.WritingOptions = []) throws {
        guard url.isFileURL else {
            throw NSError(
                domain: "com.henrikpanhans.HPFoundationUtils",
                code: 2,
                description: "The specified URL \(url.absoluteString) is not a file")
        }
        try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: nil)
        try self.write(to: url, options: options)
    }

}

struct MainCommand: ParsableCommand {

    static let configuration: CommandConfiguration = CommandConfiguration(
        commandName: "imgurr",
        abstract: "A utility to upload to and delete from Imgur",
        version: "0.0.1",
        subcommands: [Upload.self, Delete.self, Info.self],
        helpNames: .shortAndLong)

}

MainCommand.main()
