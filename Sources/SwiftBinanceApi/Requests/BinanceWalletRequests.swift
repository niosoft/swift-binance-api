import Foundation

public enum BinanceWalletRequests {
    public struct SystemStatusRequest: BinanceApiRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .sapi
        static let endpoint = "v1/system/status"

        public typealias Response = SystemStatus
    }

    public struct AllCoinInformationRequest: BinanceApiSignedRequest {
        static let method: HTTPMethod = .GET
        static let baseUrl: BinanceBaseUrl = .sapi
        static let endpoint = "v1/capital/config/getall"

        public typealias Response = AllCoinsInformation

        let timestamp: UInt64

        init() {
            timestamp = Date().millisecondsSince1970
        }
    }
}
