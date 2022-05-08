import Foundation

public extension Binance.Futures {
    // MARK: - Price

    struct Price: Codable {
        public let symbol: String
        public let price: String
        public let time: Int
    }

    typealias Prices = [Price]

    // MARK: - PriceDaily

    struct PriceDaily: Codable {
        public let symbol: String
        public let priceChange: String
        public let priceChangePercent: String
        public let weightedAvgPrice: String
        public let lastPrice: String
        public let lastQty: String
        public let openPrice: String
        public let highPrice: String
        public let lowPrice: String
        public let volume: String
        public let quoteVolume: String
        public let openTime: Int
        public let closeTime: Int
        public let firstID: Int
        public let lastID: Int
        public let count: Int

        enum CodingKeys: String, CodingKey {
            case symbol, priceChange, priceChangePercent, weightedAvgPrice, lastPrice, lastQty, openPrice, highPrice, lowPrice, volume, quoteVolume, openTime, closeTime
            case firstID = "firstId"
            case lastID = "lastId"
            case count
        }

        public init(symbol: String, priceChange: String, priceChangePercent: String, weightedAvgPrice: String, lastPrice: String, lastQty: String, openPrice: String, highPrice: String, lowPrice: String, volume: String, quoteVolume: String, openTime: Int, closeTime: Int, firstID: Int, lastID: Int, count: Int) {
            self.symbol = symbol
            self.priceChange = priceChange
            self.priceChangePercent = priceChangePercent
            self.weightedAvgPrice = weightedAvgPrice
            self.lastPrice = lastPrice
            self.lastQty = lastQty
            self.openPrice = openPrice
            self.highPrice = highPrice
            self.lowPrice = lowPrice
            self.volume = volume
            self.quoteVolume = quoteVolume
            self.openTime = openTime
            self.closeTime = closeTime
            self.firstID = firstID
            self.lastID = lastID
            self.count = count
        }
    }

    typealias PricesDaily = [PriceDaily]
}
