import Foundation

public struct BinanceFuturesRequests {
    private init() {}

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
}
