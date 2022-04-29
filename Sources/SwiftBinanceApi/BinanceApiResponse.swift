//
//  BinanceApiResponse.swift
//  BinanceApi
//
//  Created by Dionisis Karatzas on 29/4/22.
//

import Foundation

public enum BinanceApiResponse<T: Decodable>: Decodable {
	case error(BinanceApiErrorResponse)
	case result(T)

	public init(from decoder: Decoder) throws {
		do {
			self = .error(try BinanceApiErrorResponse(from: decoder))
		} catch (error: DecodingError.keyNotFound(_, _)) {
			self = .result(try T(from: decoder))
		} catch (error: DecodingError.typeMismatch(_, _)) {
			self = .result(try T(from: decoder))
		}
	}
}

public struct BinanceApiErrorResponse: Codable, Error {
	let code: Int64
	let message: String

	enum CodingKeys: String, CodingKey {
		case code
		case message = "msg"
	}
}
