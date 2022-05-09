import Foundation

public extension Binance.Spot {
    struct ExchangeInfo: Codable {
        public let timezone: String
        public let serverTime: Int
        public let rateLimits: [RateLimit]
        public let exchangeFilters: [JSONAny]
        public let symbols: [Symbol]

        public init(timezone: String, serverTime: Int, rateLimits: [RateLimit], exchangeFilters: [JSONAny], symbols: [Symbol]) {
            self.timezone = timezone
            self.serverTime = serverTime
            self.rateLimits = rateLimits
            self.exchangeFilters = exchangeFilters
            self.symbols = symbols
        }
    }

    struct RateLimit: Codable {
        public let rateLimitType: String
        public let interval: String
        public let intervalNum: Int
        public let limit: Int

        public init(rateLimitType: String, interval: String, intervalNum: Int, limit: Int) {
            self.rateLimitType = rateLimitType
            self.interval = interval
            self.intervalNum = intervalNum
            self.limit = limit
        }
    }

    struct Symbol: Codable {
        public let symbol: String
        public let status: Status
        public let baseAsset: String
        public let baseAssetPrecision: Int
        public let quoteAsset: QuoteAsset
        public let quotePrecision: Int
        public let quoteAssetPrecision: Int
        public let baseCommissionPrecision: Int
        public let quoteCommissionPrecision: Int
        public let orderTypes: [OrderType]
        public let icebergAllowed: Bool
        public let ocoAllowed: Bool
        public let quoteOrderQtyMarketAllowed: Bool
        public let allowTrailingStop: Bool
        public let isSpotTradingAllowed: Bool
        public let isMarginTradingAllowed: Bool
        public let filters: [Filter]
        public let permissions: [Permission]

        public init(symbol: String, status: Status, baseAsset: String, baseAssetPrecision: Int, quoteAsset: QuoteAsset, quotePrecision: Int, quoteAssetPrecision: Int, baseCommissionPrecision: Int, quoteCommissionPrecision: Int, orderTypes: [OrderType], icebergAllowed: Bool, ocoAllowed: Bool, quoteOrderQtyMarketAllowed: Bool, allowTrailingStop: Bool, isSpotTradingAllowed: Bool, isMarginTradingAllowed: Bool, filters: [Filter], permissions: [Permission]) {
            self.symbol = symbol
            self.status = status
            self.baseAsset = baseAsset
            self.baseAssetPrecision = baseAssetPrecision
            self.quoteAsset = quoteAsset
            self.quotePrecision = quotePrecision
            self.quoteAssetPrecision = quoteAssetPrecision
            self.baseCommissionPrecision = baseCommissionPrecision
            self.quoteCommissionPrecision = quoteCommissionPrecision
            self.orderTypes = orderTypes
            self.icebergAllowed = icebergAllowed
            self.ocoAllowed = ocoAllowed
            self.quoteOrderQtyMarketAllowed = quoteOrderQtyMarketAllowed
            self.allowTrailingStop = allowTrailingStop
            self.isSpotTradingAllowed = isSpotTradingAllowed
            self.isMarginTradingAllowed = isMarginTradingAllowed
            self.filters = filters
            self.permissions = permissions
        }
    }
}
