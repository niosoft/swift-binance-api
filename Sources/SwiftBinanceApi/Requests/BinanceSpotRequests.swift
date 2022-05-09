import Foundation

public struct BinanceSpotRequests {
    private init() {}

    // MARK: Market

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

        public typealias Response = Binance.Spot.ExchangeInfo
    }

    public struct OrderBookRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .base
        static let endpoint = "v3/depth"

        public typealias Response = Binance.Spot.OrderBook

        public let symbol: String
        public let limit: UInt
    }

    public struct RecentTradesRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .base
        static let endpoint = "v3/trades"

        public typealias Response = Binance.Spot.Trades

        public let symbol: String
        public let limit: UInt
    }

    // MARK: Wallet

    public struct SystemStatusRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .sapi
        static let endpoint = "v1/system/status"

        public typealias Response = Binance.Spot.SystemStatus
    }

    public struct AllCoinInformationRequest: BinanceApiSignedRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .sapi
        static let endpoint = "v1/capital/config/getall"

        public typealias Response = Binance.Spot.AllCoinsInformation

        let timestamp: UInt64

        init() {
            timestamp = Date().millisecondsSince1970
        }
    }

    public struct ApiRestrictionsRequest: BinanceApiSignedRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .sapi
        static let endpoint = "v1/account/apiRestrictions"

        public typealias Response = Binance.Spot.ApiRestrictions

        let timestamp: UInt64

        init() {
            timestamp = Date().millisecondsSince1970
        }
    }
}
