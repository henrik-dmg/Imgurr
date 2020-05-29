import AppKit
import Foundation
import CLIFoundation
import CoreImage
import HPNetwork

public class ImgurHandler {

    @CodableStorable(key: "saved_responses", defaultValue: [])
    private var savedResponses: [ImgurResponse]

    let clientID: String = "1d3041a440a4c66"

    public init() {
        
    }

    public func uploadImage(at url: URL) throws -> ImgurResponse {
        let group = DispatchGroup()
        group.enter()

        var imgurReponse: ImgurResponse?
        var error: Error?

        let request = DecodableRequest<ImgurResponse>(
            urlString: "https://api.imgur.com/3/image",
            requestMethod: .post,
            authentication: .raw(string: "Client-ID \(clientID)"))

        print("posting request")

        Network.shared.uploadTask(request, fileURL: url) { result in
            switch result {
            case .success(let response):
                imgurReponse = response
            case .failure(let networkingError):
                error = networkingError
            }

            print("handling response")
            group.leave()
        }

        group.wait()

        guard error == nil else {
            throw error!
        }

        guard let response = imgurReponse else {
            throw NSError(description: "Did not get any response")
        }

        savedResponses.append(response)

        return response
    }

    public func deleteImage(deleteHash: String) throws {
        let group = DispatchGroup()
        group.enter()

        var error: Error?

        let request = DeleteRequest(urlString: "https://api.imgur.com/3/image/\(deleteHash)")

        Network.shared.dataTask(request) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let networkingError):
                error = networkingError
            }
        }

        group.wait()

        if let error = error {
            throw error
        } else {
            if let index = savedResponses.firstIndex(where: { $0.data.deleteHash == deleteHash }) {
                savedResponses.remove(at: index)
            }
        }
    }

    public func deleteImage(url: URL) throws {
        guard let response = savedResponses.first(where: { $0.data.link == url }) else {
            throw NSError(description: "Unable to find a delete hash for this image URL")
        }

        try deleteImage(deleteHash: response.data.deleteHash)
    }

    public func printSavedData() {
        print(savedResponses)
    }

}

final class DeleteRequest: NetworkRequest {

    typealias Output = Data

    public let requestMethod: NetworkRequestMethod
    public let authentication: NetworkRequestAuthentication?

    private let urlString: String

    var url: URL? {
        URL(string: urlString)
    }

    public init(urlString: String, authentication: NetworkRequestAuthentication? = nil) {
        self.urlString = urlString
        self.requestMethod = .delete
        self.authentication = authentication
    }

}
