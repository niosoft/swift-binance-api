import Foundation

internal final class BinanceApiClient {
    private let apiKey: String
    private let secretKey: String
    private let session: URLSession
    private let receiveWindow: UInt

    internal init(apiKey: String, secretKey: String, receiveWindow: UInt) {
        self.apiKey = apiKey
        self.secretKey = secretKey
        self.receiveWindow = receiveWindow
        session = URLSession.shared
    }

    internal func send<T: BinanceApiRequest>(_ request: T) async throws -> T.Response {
        let urlRequest = try request.urlRequest(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)

        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let responseData = data, error == nil else {
                    if let error = error {
                        continuation.resume(throwing: BinanceApiError.unknown(error))
                    } else {
                        continuation.resume(throwing: BinanceApiError.networkError(data, response))
                    }
                    return
                }

                let decoder = JSONDecoder()

                do {
                    let object = try decoder.decode(BinanceApiResponse<T.Response>.self, from: responseData)

                    switch object {
                    case BinanceApiResponse<T.Response>.error(let error):
                        continuation.resume(throwing: error)
                    case BinanceApiResponse<T.Response>.result(let response):
                        continuation.resume(returning: response)
                    }
                } catch {
                    continuation.resume(throwing: BinanceApiError.unknown(error))
                }
            }.resume()
        }
    }
}
