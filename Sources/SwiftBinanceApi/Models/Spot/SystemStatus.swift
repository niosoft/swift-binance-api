import Foundation

public extension Binance.Spot {
    // MARK: - SystemStatus

    struct SystemStatus: Codable {
        public let status: Status
        public let msg: String

        public init(status: Status, msg: String) {
            self.status = status
            self.msg = msg
        }

        public enum Status: Int, Codable {
            case normal = 0
            case systemMaintenance = 1
        }
    }
}
