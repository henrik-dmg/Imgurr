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

}
