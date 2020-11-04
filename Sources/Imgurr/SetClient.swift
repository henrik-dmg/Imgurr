import ArgumentParser
import Foundation
import ImgurrCore

struct SetClient: ParsableCommand {

	static let configuration: CommandConfiguration = CommandConfiguration(
		commandName: "set-client",
		abstract: "Updates the client ID that is used for communicating with the Imgur API",
		helpNames: .shortAndLong
	)

	@Argument(help: "The Client ID from the Imgur Developer Console")
	var id: String

	func run() throws {
		UserDefaults.standard.setValue(id, forKey: "clientID")
		print("Client ID was updated")
		print("Note: Images can only be deleted using the same client ID as the one that was used to upload them".addingTerminalColor(.yellow))
	}

}
