import Foundation

public extension Binance.Futures {
    struct ExchangeInfo: Codable {
        public let timezone: String
        public let serverTime: Int
        public let futuresType: String
        public let rateLimits: [RateLimit]
        public let exchangeFilters: [JSONAny]
        public let assets: [Asset]
        public let symbols: [Symbol]

        public init(timezone: String, serverTime: Int, futuresType: String, rateLimits: [RateLimit], exchangeFilters: [JSONAny], assets: [Asset], symbols: [Symbol]) {
            self.timezone = timezone
            self.serverTime = serverTime
            self.futuresType = futuresType
            self.rateLimits = rateLimits
            self.exchangeFilters = exchangeFilters
            self.assets = assets
            self.symbols = symbols
        }

        public struct Asset: Codable {
            public let asset: String
            public let marginAvailable: Bool
            public let autoAssetExchange: String

            public init(asset: String, marginAvailable: Bool, autoAssetExchange: String) {
                self.asset = asset
                self.marginAvailable = marginAvailable
                self.autoAssetExchange = autoAssetExchange
            }
        }

        public struct RateLimit: Codable {
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

        public struct Symbol: Codable {
            public let symbol: String
            public let pair: String
            public let contractType: ContractType
            public let deliveryDate: Int
            public let onboardDate: Int
            public let status: ContractStatus
            public let maintMarginPercent: String
            public let requiredMarginPercent: String
            public let baseAsset: String
            public let quoteAsset: String
            public let marginAsset: String
            public let pricePrecision: Int
            public let quantityPrecision: Int
            public let baseAssetPrecision: Int
            public let quotePrecision: Int
            public let underlyingType: String
            public let underlyingSubType: [String]
            public let settlePlan: Int
            public let triggerProtect: String
            public let liquidationFee: String
            public let marketTakeBound: String
            public let filters: [Filter]
            public let orderTypes: [OrderType]
            public let timeInForce: [TimeInForce]

            public init(symbol: String, pair: String, contractType: ContractType, deliveryDate: Int, onboardDate: Int, status: ContractStatus, maintMarginPercent: String, requiredMarginPercent: String, baseAsset: String, quoteAsset: String, marginAsset: String, pricePrecision: Int, quantityPrecision: Int, baseAssetPrecision: Int, quotePrecision: Int, underlyingType: String, underlyingSubType: [String], settlePlan: Int, triggerProtect: String, liquidationFee: String, marketTakeBound: String, filters: [Filter], orderTypes: [OrderType], timeInForce: [TimeInForce]) {
                self.symbol = symbol
                self.pair = pair
                self.contractType = contractType
                self.deliveryDate = deliveryDate
                self.onboardDate = onboardDate
                self.status = status
                self.maintMarginPercent = maintMarginPercent
                self.requiredMarginPercent = requiredMarginPercent
                self.baseAsset = baseAsset
                self.quoteAsset = quoteAsset
                self.marginAsset = marginAsset
                self.pricePrecision = pricePrecision
                self.quantityPrecision = quantityPrecision
                self.baseAssetPrecision = baseAssetPrecision
                self.quotePrecision = quotePrecision
                self.underlyingType = underlyingType
                self.underlyingSubType = underlyingSubType
                self.settlePlan = settlePlan
                self.triggerProtect = triggerProtect
                self.liquidationFee = liquidationFee
                self.marketTakeBound = marketTakeBound
                self.filters = filters
                self.orderTypes = orderTypes
                self.timeInForce = timeInForce
            }
        }
    }
}
