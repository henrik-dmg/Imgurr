import Foundation

public struct ImgurResponse: Codable {

    public struct ResponseData: Codable {
        public let id: String
        public let link: URL
        public let type: String
        public let deleteHash: String
        public let date: Date

        enum CodingKeys: String, CodingKey {
            case id
            case link
            case type
            case deleteHash = "deletehash"
            case date = "datetime"
        }
    }

    public let success: Bool
    public let status: Int
    public let data: ResponseData

    public func makeTerminalRepresenation() -> String {
        var string = "Imgur Image \(data.link.absoluteString)".addingTerminalTextDecoration(.underline)
        string += "\nID: \(data.id)"
        string += "\nType: \(data.type)"
        string += "\nDelete hash: \(data.deleteHash)"
        string += "\nDate uploaded: \(data.date.localizedString)"

        return string
    }

}

extension Date {

    var localizedString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale.autoupdatingCurrent
        formatter.calendar = Calendar.autoupdatingCurrent
        formatter.timeZone = TimeZone.autoupdatingCurrent

        formatter.dateStyle = .short
        return formatter.string(from: self)
    }

}
