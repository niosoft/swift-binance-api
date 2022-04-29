//
//  BinanceMarketRequests.swift
//  BinanceApi
//
//  Created by Dionisis Karatzas on 2/5/22.
//

import Foundation

public enum BinanceMarketRequests {
	public struct TimeRequest: BinanceApiRequest {
		static let method: HTTPMethod = .GET
		static let baseUrl: BinanceBaseUrl = .base
		static let endpoint = "v3/time"

		public struct Response: Decodable {
			public let serverTime: UInt
		}
	}

	public struct ExchangeInfoRequest: BinanceApiRequest {
		static let method: HTTPMethod = .GET
		static let baseUrl: BinanceBaseUrl = .base
		static let endpoint = "v3/exchangeInfo"

		public typealias Response = ExchangeInfo
	}

	public struct OrderBookRequest: BinanceApiRequest {
		static let method: HTTPMethod = .GET
		static let baseUrl: BinanceBaseUrl = .base
		static let endpoint = "v3/depth"

		public typealias Response = OrderBook

		public let symbol: String
		public let limit: UInt
	}

	public struct RecentTradesRequest: BinanceApiRequest {
		static let method: HTTPMethod = .GET
		static let baseUrl: BinanceBaseUrl = .base
		static let endpoint = "v3/trades"

		public typealias Response = Trades

		public let symbol: String
		public let limit: UInt
	}
}
