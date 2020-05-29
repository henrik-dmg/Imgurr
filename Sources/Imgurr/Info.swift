import ArgumentParser
import Foundation
import ImgurrCore

struct Info: ParsableCommand {

    func run() throws {
        let handler = ImgurHandler()
        handler.printSavedData()
    }

}
