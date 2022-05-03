//
//  BinanceApiClient.swift
//  BinanceApi
//
//  Created by Dionisis Karatzas on 29/4/22.
//

import Foundation

internal final class BinanceApiClient {
	private let apiKey: String
	private let secretKey: String
	private let session: URLSession
	private let receiveWindow: TimeInterval

	internal init(apiKey: String, secretKey: String, receiveWindow: TimeInterval) {
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
					continuation.resume(throwing: error != nil ? BinanceApiError.unknown(error!) : BinanceApiError.networkError(data, response) )
					return
				}

				let decoder = JSONDecoder()

				var object: BinanceApiResponse<T.Response>?

				do {
					object = try decoder.decode(BinanceApiResponse<T.Response>.self, from: responseData)
				} catch {
					continuation.resume(throwing: BinanceApiError.unknown(error))
				}

				switch object! {
					case BinanceApiResponse<T.Response>.error(let error):
						continuation.resume(throwing: error)
					case BinanceApiResponse<T.Response>.result(let response):
						continuation.resume(returning: response)
				}
			}.resume()
		}
	}
}
