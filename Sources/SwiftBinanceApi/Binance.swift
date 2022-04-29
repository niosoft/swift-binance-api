//
//  BinanceApi.swift
//  BinanceApi
//
//  Created by Dionisis Karatzas on 29/4/22.
//

import Foundation

public final class Binance {
	private let apiClient: BinanceApiClient

	let market: Market
	let wallet: Wallet

	public init(apiKey: String, secretKey: String, receiveWindow: TimeInterval = 5000) {
		apiClient = BinanceApiClient(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
		market = Market(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
		wallet = Wallet(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
	}

	public final class Market {
		private let apiClient: BinanceApiClient

		fileprivate init(apiKey: String, secretKey: String, receiveWindow: TimeInterval) {
			apiClient = BinanceApiClient(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
		}
	}

	public final class Wallet {
		private let apiClient: BinanceApiClient

		fileprivate init(apiKey: String, secretKey: String, receiveWindow: TimeInterval) {
			apiClient = BinanceApiClient(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
		}
	}
}

// MARK: - Market
public extension Binance.Market {
	/// Test connectivity to the Rest API and get the current server time.
	/// - returns: `UInt`
	/// - throws: ``BinanceApiError``
	func serverTime() async throws -> UInt {
		return try await apiClient.send(BinanceMarketRequests.TimeRequest()).serverTime
	}

	/// Current exchange trading rules and symbol information
	///
	/// - returns: ``ExchangeInfo``
	/// - throws: ``BinanceApiError``
	func exchangeInfo() async throws -> ExchangeInfo {
		return try await apiClient.send(BinanceMarketRequests.ExchangeInfoRequest())
	}

	/// Get order book
	///
	/// - parameter symbol: The symbol
	/// - parameter limit: The limit. Default 100; max 5000. If limit > 5000, then the response will truncate to 5000.
	/// - returns: ``OrderBook``
	/// - throws: ``BinanceApiError``
	func orderBook(symbol: String, limit: UInt = 100) async throws -> OrderBook {
		return try await apiClient.send(BinanceMarketRequests.OrderBookRequest(symbol: symbol, limit: limit))
	}

	/// Get recent trades
	///
	/// - parameter symbol: The symbol
	/// - parameter limit: The limit. Default 500; max 1000.  If limit > 1000, then the response will truncate to 1000.
	/// - returns: ``OrderBook``
	/// - throws: ``BinanceApiError``
	func recentTrades(symbol: String, limit: UInt = 500) async throws -> Trades {
		return try await apiClient.send(BinanceMarketRequests.RecentTradesRequest(symbol: symbol, limit: limit))
	}
}

// MARK: - Wallet
public extension Binance.Wallet {
	/// Fetch system status.
	/// - returns: ``SystemStatus``
	/// - throws: ``BinanceApiError``
	func systemStatus() async throws -> SystemStatus {
		return try await apiClient.send(BinanceWalletRequests.SystemStatusRequest())
	}
}
