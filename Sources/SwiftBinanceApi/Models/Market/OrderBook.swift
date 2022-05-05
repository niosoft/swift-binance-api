import Foundation

// MARK: - OrderBook

public struct OrderBook: Codable {
    public let lastUpdateID: Int
    public let bids: [[String]]
    public let asks: [[String]]

    enum CodingKeys: String, CodingKey {
        case lastUpdateID = "lastUpdateId"
        case bids, asks
    }

    public init(lastUpdateID: Int, bids: [[String]], asks: [[String]]) {
        self.lastUpdateID = lastUpdateID
        self.bids = bids
        self.asks = asks
    }
}
