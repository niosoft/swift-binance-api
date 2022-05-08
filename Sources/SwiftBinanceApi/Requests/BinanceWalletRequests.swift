import Foundation

public enum BinanceWalletRequests {
    public struct SystemStatusRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .sapi
        static let endpoint = "v1/system/status"

        public typealias Response = Binance.Spot.SystemStatus
    }

    public struct AllCoinInformationRequest: BinanceApiSignedRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .sapi
        static let endpoint = "v1/capital/config/getall"

        public typealias Response = Binance.Spot.AllCoinsInformation

        let timestamp: UInt64

        init() {
            timestamp = Date().millisecondsSince1970
        }
    }

    public struct ApiRestrictionsRequest: BinanceApiSignedRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .sapi
        static let endpoint = "v1/account/apiRestrictions"

        public typealias Response = Binance.Spot.ApiRestrictions

        let timestamp: UInt64

        init() {
            timestamp = Date().millisecondsSince1970
        }
    }
}
