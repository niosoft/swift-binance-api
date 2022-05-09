import Foundation

public extension Binance.Spot {
    struct ApiRestrictions: Codable {
        public let ipRestrict: Bool
        public let createTime: Int
        public let enableReading: Bool
        public let enableSpotAndMarginTrading: Bool
        public let enableWithdrawals: Bool
        public let enableInternalTransfer: Bool
        public let permitsUniversalTransfer: Bool
        public let enableMargin: Bool
        public let enableFutures: Bool
        public let enableVanillaOptions: Bool

        enum CodingKeys: String, CodingKey {
            case ipRestrict
            case createTime
            case enableReading
            case enableSpotAndMarginTrading
            case enableWithdrawals
            case enableInternalTransfer
            case permitsUniversalTransfer
            case enableMargin
            case enableFutures
            case enableVanillaOptions
        }

        public init(ipRestrict: Bool, createTime: Int, enableReading: Bool, enableSpotAndMarginTrading: Bool, enableWithdrawals: Bool, enableInternalTransfer: Bool, permitsUniversalTransfer: Bool, enableMargin: Bool, enableFutures: Bool, enableVanillaOptions: Bool) {
            self.ipRestrict = ipRestrict
            self.createTime = createTime
            self.enableReading = enableReading
            self.enableSpotAndMarginTrading = enableSpotAndMarginTrading
            self.enableWithdrawals = enableWithdrawals
            self.enableInternalTransfer = enableInternalTransfer
            self.permitsUniversalTransfer = permitsUniversalTransfer
            self.enableMargin = enableMargin
            self.enableFutures = enableFutures
            self.enableVanillaOptions = enableVanillaOptions
        }
    }
}
