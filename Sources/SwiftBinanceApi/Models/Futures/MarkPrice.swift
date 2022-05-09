import Foundation

public extension Binance.Futures {
    struct MarkPrice: Codable {
        public let symbol: String
        public let markPrice: String
        public let indexPrice: String
        public let estimatedSettlePrice: String
        public let lastFundingRate: String
        public let interestRate: String
        public let nextFundingTime: Int
        public let time: Int

        public init(symbol: String, markPrice: String, indexPrice: String, estimatedSettlePrice: String, lastFundingRate: String, interestRate: String, nextFundingTime: Int, time: Int) {
            self.symbol = symbol
            self.markPrice = markPrice
            self.indexPrice = indexPrice
            self.estimatedSettlePrice = estimatedSettlePrice
            self.lastFundingRate = lastFundingRate
            self.interestRate = interestRate
            self.nextFundingTime = nextFundingTime
            self.time = time
        }
    }

    typealias MarkPrices = [MarkPrice]
}
