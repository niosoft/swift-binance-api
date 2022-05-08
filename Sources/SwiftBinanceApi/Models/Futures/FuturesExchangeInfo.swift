import Foundation

public extension Binance.Futures {
    // MARK: - Account

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

        // MARK: - Asset

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

        // MARK: - RateLimit

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

        // MARK: - Symbol

        public struct Symbol: Codable {
            public let symbol: String
            public let pair: String
            public let contractType: ContractType
            public let deliveryDate: Int
            public let onboardDate: Int
            public let status: Status
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

            public init(symbol: String, pair: String, contractType: ContractType, deliveryDate: Int, onboardDate: Int, status: Status, maintMarginPercent: String, requiredMarginPercent: String, baseAsset: String, quoteAsset: String, marginAsset: String, pricePrecision: Int, quantityPrecision: Int, baseAssetPrecision: Int, quotePrecision: Int, underlyingType: String, underlyingSubType: [String], settlePlan: Int, triggerProtect: String, liquidationFee: String, marketTakeBound: String, filters: [Filter], orderTypes: [OrderType], timeInForce: [TimeInForce]) {
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

    // MARK: - Filter

    struct Filter: Codable {
        public let minPrice: String?
        public let maxPrice: String?
        public let filterType: FilterType
        public let tickSize: String?
        public let stepSize: String?
        public let maxQty: String?
        public let minQty: String?
        public let limit: Int?
        public let notional: String?
        public let multiplierDown: String?
        public let multiplierUp: String?
        public let multiplierDecimal: String?

        enum CodingKeys: String, CodingKey {
            case minPrice
            case maxPrice
            case filterType
            case tickSize
            case stepSize
            case maxQty
            case minQty
            case limit
            case notional
            case multiplierDown
            case multiplierUp
            case multiplierDecimal
        }

        public init(minPrice: String?, maxPrice: String?, filterType: FilterType, tickSize: String?, stepSize: String?, maxQty: String?, minQty: String?, limit: Int?, notional: String?, multiplierDown: String?, multiplierUp: String?, multiplierDecimal: String?) {
            self.minPrice = minPrice
            self.maxPrice = maxPrice
            self.filterType = filterType
            self.tickSize = tickSize
            self.stepSize = stepSize
            self.maxQty = maxQty
            self.minQty = minQty
            self.limit = limit
            self.notional = notional
            self.multiplierDown = multiplierDown
            self.multiplierUp = multiplierUp
            self.multiplierDecimal = multiplierDecimal
        }
    }
}
