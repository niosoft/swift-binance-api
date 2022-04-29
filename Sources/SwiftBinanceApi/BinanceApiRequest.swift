//
//  BinanceApiRequest.swift
//  BinanceApi
//
//  Created by Dionisis Karatzas on 29/4/22.
//

import CryptoKit
import Foundation
import URLQueryItemEncoder

internal protocol BinanceApiRequest: Codable {
	associatedtype Response: Decodable
	static var baseUrl: BinanceBaseUrl { get }
	static var endpoint: String { get }
	static var method: HTTPMethod { get }

	func urlRequest(apiKey: String, secretKey: String, receiveWindow: TimeInterval) throws -> URLRequest
}

internal protocol BinanceApiSignedRequest: BinanceApiRequest {
	var timestamp: Date { get }
}

internal extension BinanceApiRequest {
	func urlRequest(apiKey: String, secretKey: String, receiveWindow: TimeInterval) throws -> URLRequest {
		do {
			let baseUrl = URL(string: Self.baseUrl.rawValue)!
			let url = URL(string: Self.endpoint, relativeTo: baseUrl)!

			var request = URLRequest(url: url)
			request.httpMethod = Self.method.rawValue

			let encoder = URLQueryItemEncoder()
			var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
			urlComponents.queryItems = try encoder.encode(self)

			switch Self.method {
				case .POST, .DELETE:
					request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
					request.httpBody = urlComponents.percentEncodedQuery?.data(using: .utf8)
				default:
					request.url = urlComponents.url
			}

			if urlComponents.queryItems?.first(where: { $0.name == "timestamp" }) != nil {
				urlComponents.queryItems?.append(URLQueryItem(name: "recvWindow", value: String(receiveWindow)))

				let signable = urlComponents.query ?? ""
				let signature = hmacSha256(key: secretKey, string: signable)

				urlComponents.queryItems?.append(URLQueryItem(name: "signature", value: signature))

				// Add apikey header
				request.setValue(apiKey, forHTTPHeaderField: "X-Mbx-Apikey")

				switch Self.method {
					case .POST, .DELETE:
						request.httpBody = urlComponents.percentEncodedQuery?.data(using: .utf8)
					default:
						request.url = urlComponents.url
				}

				return request
			} else {
				return request
			}
		} catch {
			throw BinanceApiError.unknown(error)
		}
	}

	private func hmacSha256(key: String, string: String) -> String {
		let key = SymmetricKey(data: key.data(using: .utf8)!)
		let signature = HMAC<SHA256>.authenticationCode(for: string.data(using: .utf8)!, using: key)
		return Data(signature).map { String(format: "%02hhx", $0) }.joined()
	}
}
