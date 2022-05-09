import Foundation

public struct BinanceFuturesRequests {
    private init() {}

    public struct TimeRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/time"

        public struct Response: Decodable {
            public let serverTime: UInt
        }
    }

    public struct PricesRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/ticker/price"

        public typealias Response = Binance.Futures.Prices
    }

    public struct SymbolPriceRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/ticker/price"

        public typealias Response = Binance.Futures.Price

        public let symbol: String
    }

    public struct PricesDailyRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/ticker/24hr"

        public typealias Response = Binance.Futures.PricesDaily
    }

    public struct SymbolPriceDailyRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/ticker/24hr"

        public typealias Response = Binance.Futures.PriceDaily

        public let symbol: String
    }

    public struct ExchangeInfoRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/exchangeInfo"

        public typealias Response = Binance.Futures.ExchangeInfo
    }

    public struct AccountInfoRequest: BinanceApiSignedRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v2/account"

        public typealias Response = Binance.Futures.AccountInfo

        let timestamp: UInt64

        init() {
            timestamp = Date().millisecondsSince1970
        }
    }

    public struct OpenInterestRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/openInterest"

        public typealias Response = Binance.Futures.OpenInterest

        public let symbol: String
    }

    public struct KlinesRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/klines"

        public typealias Response = Binance.Futures.Klines

        public let symbol: String
        public let interval: Interval
        public let limit: UInt
    }

    public struct MarkPricesRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/premiumIndex"

        public typealias Response = Binance.Futures.MarkPrices
    }

    public struct MarkPriceRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/premiumIndex"

        public typealias Response = Binance.Futures.MarkPrice

        public let symbol: String
    }

    public struct TradesRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/trades"

        public typealias Response = Binance.Futures.Trades

        public let symbol: String
        public let limit: UInt
    }

    public struct HistoricalTradesRequest: BinanceApiSignedRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .fapi
        static let endpoint = "v1/historicalTrades"

        public typealias Response = Binance.Futures.Trades

        public let symbol: String
        public let limit: UInt
        public let fromId: UInt?

        let timestamp: UInt64

        init(symbol: String, limit: UInt, fromId: UInt?) {
            self.symbol = symbol
            self.limit = limit
            self.fromId = fromId
            timestamp = Date().millisecondsSince1970
        }
    }
}
