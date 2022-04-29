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

		let (data, _) = try await URLSession.shared.data(for: urlRequest)
		let decoder = JSONDecoder()

		let object: BinanceApiResponse<T.Response>?

		do {
			object = try decoder.decode(BinanceApiResponse<T.Response>.self, from: data)
		} catch {
			throw BinanceApiError.unknown(error)
		}

		switch object! {
			case BinanceApiResponse<T.Response>.error(let error):
				throw error
			case BinanceApiResponse<T.Response>.result(let response):
				return response
		}
	}
}
