import Foundation

public final class Binance {
    private let apiClient: BinanceApiClient

    let spot: Spot
    let futures: Futures

    public init(apiKey: String, secretKey: String, receiveWindow: UInt = 15000) {
        apiClient = BinanceApiClient(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
        spot = Spot(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
        futures = Futures(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
    }

    public final class Spot {
        private let apiClient: BinanceApiClient

        fileprivate init(apiKey: String, secretKey: String, receiveWindow: UInt) {
            apiClient = BinanceApiClient(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
        }
    }

    public final class Futures {
        private let apiClient: BinanceApiClient

        fileprivate init(apiKey: String, secretKey: String, receiveWindow: UInt) {
            apiClient = BinanceApiClient(apiKey: apiKey, secretKey: secretKey, receiveWindow: receiveWindow)
        }
    }
}

// MARK: - Spot

public extension Binance.Spot {
    /// Test connectivity to the Rest API and get the current server time.
    /// - returns: `UInt`
    /// - throws: ``BinanceApiError``
    func serverTime() async throws -> UInt {
        return try await apiClient.send(BinanceSpotRequests.TimeRequest()).serverTime
    }

    /// Current exchange trading rules and symbol information
    ///
    /// - returns: ``ExchangeInfo``
    /// - throws: ``BinanceApiError``
    func exchangeInfo() async throws -> ExchangeInfo {
        return try await apiClient.send(BinanceSpotRequests.ExchangeInfoRequest())
    }

    /// Get order book
    ///
    /// - parameter symbol: The symbol
    /// - parameter limit: The limit. Default 100; max 5000. If limit > 5000, then the response will truncate to 5000.
    /// - returns: ``OrderBook``
    /// - throws: ``BinanceApiError``
    func orderBook(symbol: String, limit: UInt = 100) async throws -> OrderBook {
        return try await apiClient.send(BinanceSpotRequests.OrderBookRequest(symbol: symbol, limit: limit))
    }

    /// Get recent trades
    ///
    /// - parameter symbol: The symbol
    /// - parameter limit: The limit. Default 500; max 1000.  If limit > 1000, then the response will truncate to 1000.
    /// - returns: ``OrderBook``
    /// - throws: ``BinanceApiError``
    func recentTrades(symbol: String, limit: UInt = 500) async throws -> Trades {
        return try await apiClient.send(BinanceSpotRequests.RecentTradesRequest(symbol: symbol, limit: limit))
    }

    /// Fetch system status.
    /// - returns: ``SystemStatus``
    /// - throws: ``BinanceApiError``
    func systemStatus() async throws -> SystemStatus {
        return try await apiClient.send(BinanceSpotRequests.SystemStatusRequest())
    }

    /// Get information of coins (available for deposit and withdraw) for user.
    /// - returns: ``AllCoinsInformation``
    /// - throws: ``BinanceApiError``
    func allCoinsInformation() async throws -> AllCoinsInformation {
        return try await apiClient.send(BinanceSpotRequests.AllCoinInformationRequest())
    }

    /// Fetch system status.
    /// - returns: ``ApiRestrictions``
    /// - throws: ``BinanceApiError``
    func apiRestrictions() async throws -> ApiRestrictions {
        return try await apiClient.send(BinanceSpotRequests.ApiRestrictionsRequest())
    }
}

// MARK: - Futures

public extension Binance.Futures {
    /// Test connectivity to the Rest API and get the current server time.
    /// - returns: `UInt`
    /// - throws: ``BinanceApiError``
    func serverTime() async throws -> UInt {
        return try await apiClient.send(BinanceFuturesRequests.TimeRequest()).serverTime
    }

    /// Latest price for all symbols.
    /// - returns: ``Prices``
    /// - throws: ``BinanceApiError``
    func prices() async throws -> Prices {
        return try await apiClient.send(BinanceFuturesRequests.PricesRequest())
    }

    /// Latest price for a symbol.
    /// - returns: ``Price``
    /// - throws: ``BinanceApiError``
    func price(symbol: String) async throws -> Price {
        return try await apiClient.send(BinanceFuturesRequests.SymbolPriceRequest(symbol: symbol))
    }

    /// 24 hour rolling window price change statistics for all symbols.
    /// - returns: ``PricesDaily``
    /// - throws: ``BinanceApiError``
    func pricesDaily() async throws -> PricesDaily {
        return try await apiClient.send(BinanceFuturesRequests.PricesDailyRequest())
    }

    /// 24 hour rolling window price change statistics for a symbol.
    /// - returns: ``PriceDaily``
    /// - throws: ``BinanceApiError``
    func priceDaily(symbol: String) async throws -> PriceDaily {
        return try await apiClient.send(BinanceFuturesRequests.SymbolPriceDailyRequest(symbol: symbol))
    }

    /// Current exchange trading rules and symbol information
    ///
    /// - returns: ``ExchangeInfo``
    /// - throws: ``BinanceApiError``
    func exchangeInfo() async throws -> ExchangeInfo {
        return try await apiClient.send(BinanceFuturesRequests.ExchangeInfoRequest())
    }

    /// Get current account information.
    ///
    /// - returns: ``AccountInfo``
    /// - throws: ``BinanceApiError``
    func accountInfo() async throws -> AccountInfo {
        return try await apiClient.send(BinanceFuturesRequests.AccountInfoRequest())
    }

    /// Get present open interest of a specific symbol.
    ///
    /// - returns: ``OpenInterest``
    /// - throws: ``BinanceApiError``
    func openInterest(symbol: String) async throws -> OpenInterest {
        return try await apiClient.send(BinanceFuturesRequests.OpenInterestRequest(symbol: symbol))
    }

    /// Kline/candlestick bars for a symbol. Klines are uniquely identified by their open time.
    ///
    ///     [
    /// 		1499040000000,      // Open time
    /// 		"0.01634790",       // Open
    /// 		"0.80000000",       // High
    /// 		"0.01575800",       // Low
    /// 		"0.01577100",       // Close
    /// 		"148976.11427815",  // Volume
    /// 		1499644799999,      // Close time
    /// 		"2434.19055334",    // Quote asset volume
    /// 		308,                // Number of trades
    /// 		"1756.87402397",    // Taker buy base asset volume
    /// 		"28.46694368",      // Taker buy quote asset volume
    /// 		"17928899.62484339" // Ignore.
    ///     ]
    ///
    /// - parameters:
    ///     - symbol: The symbol
    ///     - interval: The ``Interval``
    ///     - limit: The limit. Default 500; max 1500.  If limit > 1500, an error will be thrown.
    /// - returns: ``Klines``
    /// - throws: ``BinanceApiError``
    /// - note:
    ///
    func klines(symbol: String, interval: Interval, limit: UInt = 500) async throws -> Klines {
        return try await apiClient.send(BinanceFuturesRequests.KlinesRequest(symbol: symbol, interval: interval, limit: limit))
    }

    /// Mark Price and Funding Rate for all symbols.
    ///
    /// - returns: ``MarkPrices``
    /// - throws: ``BinanceApiError``
    func markPrices() async throws -> MarkPrices {
        return try await apiClient.send(BinanceFuturesRequests.MarkPricesRequest())
    }

    /// Mark Price and Funding Rate for a symbol.
    ///
    /// - returns: ``MarkPrice``
    /// - throws: ``BinanceApiError``
    func markPrice(symbol: String) async throws -> MarkPrice {
        return try await apiClient.send(BinanceFuturesRequests.MarkPriceRequest(symbol: symbol))
    }

    /// Get recent market trades.
    ///
    /// Market trades means trades filled in the order book. Only market trades will be returned, which means the insurance fund trades and ADL trades won't be returned.
    ///
    /// - parameters:
    ///     - symbol: The symbol
    ///     - limit: The limit. Default 500; max 1000.  If limit > 1000, an error will be thrown.
    /// - returns: ``Trades``
    /// - throws: ``BinanceApiError``
    func recentTrades(symbol: String, limit: UInt = 500) async throws -> Trades {
        return try await apiClient.send(BinanceFuturesRequests.TradesRequest(symbol: symbol, limit: limit))
    }

    /// Get older market historical trades.
    ///
    /// Market trades means trades filled in the order book. Only market trades will be returned, which means the insurance fund trades and ADL trades won't be returned.
    ///
    /// - parameters:
    ///     - symbol: The symbol
    ///     - limit: The limit. Default 500; max 1000.  If limit > 1000, an error will be thrown.
    ///     - fromId: TradeId to fetch from. Default(nil) gets most recent trades.
    /// - returns: ``Trades``
    /// - throws: ``BinanceApiError``
    func historicalTrades(symbol: String, limit: UInt = 500, fromId: UInt? = nil) async throws -> Trades {
        return try await apiClient.send(BinanceFuturesRequests.HistoricalTradesRequest(symbol: symbol, limit: limit, fromId: fromId))
    }
}
