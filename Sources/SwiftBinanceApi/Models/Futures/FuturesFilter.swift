//
//  File.swift
//
//
//  Created by Dionisis Karatzas on 8/5/22.
//

import Foundation

public extension Binance.Futures {
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
