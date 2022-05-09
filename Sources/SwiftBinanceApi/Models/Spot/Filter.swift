import Foundation

public extension Binance.Spot {
    struct Filter: Codable {
        public let filterType: FilterType
        public let minPrice: String?
        public let maxPrice: String?
        public let tickSize: String?
        public let multiplierUp: String?
        public let multiplierDown: String?
        public let avgPriceMins: Int?
        public let minQty: String?
        public let maxQty: String?
        public let stepSize: String?
        public let minNotional: String?
        public let applyToMarket: Bool?
        public let limit: Int?
        public let minTrailingAboveDelta: Int?
        public let maxTrailingAboveDelta: Int?
        public let minTrailingBelowDelta: Int?
        public let maxTrailingBelowDelta: Int?
        public let maxNumOrders: Int?
        public let maxNumAlgoOrders: Int?
        public let maxPosition: String?

        public init(filterType: FilterType, minPrice: String?, maxPrice: String?, tickSize: String?, multiplierUp: String?, multiplierDown: String?, avgPriceMins: Int?, minQty: String?, maxQty: String?, stepSize: String?, minNotional: String?, applyToMarket: Bool?, limit: Int?, minTrailingAboveDelta: Int?, maxTrailingAboveDelta: Int?, minTrailingBelowDelta: Int?, maxTrailingBelowDelta: Int?, maxNumOrders: Int?, maxNumAlgoOrders: Int?, maxPosition: String?) {
            self.filterType = filterType
            self.minPrice = minPrice
            self.maxPrice = maxPrice
            self.tickSize = tickSize
            self.multiplierUp = multiplierUp
            self.multiplierDown = multiplierDown
            self.avgPriceMins = avgPriceMins
            self.minQty = minQty
            self.maxQty = maxQty
            self.stepSize = stepSize
            self.minNotional = minNotional
            self.applyToMarket = applyToMarket
            self.limit = limit
            self.minTrailingAboveDelta = minTrailingAboveDelta
            self.maxTrailingAboveDelta = maxTrailingAboveDelta
            self.minTrailingBelowDelta = minTrailingBelowDelta
            self.maxTrailingBelowDelta = maxTrailingBelowDelta
            self.maxNumOrders = maxNumOrders
            self.maxNumAlgoOrders = maxNumAlgoOrders
            self.maxPosition = maxPosition
        }
    }
}
