import Foundation

public extension Binance.Futures {
    struct OpenInterest: Codable {
        public let openInterest: String
        public let symbol: String
        public let time: Int

        public init(openInterest: String, symbol: String, time: Int) {
            self.openInterest = openInterest
            self.symbol = symbol
            self.time = time
        }
    }
}
