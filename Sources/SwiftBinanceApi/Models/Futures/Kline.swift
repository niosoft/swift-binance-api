import Foundation

public extension Binance.Futures {
    enum Kline: Codable {
        case integer(Int)
        case string(String)

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode(Int.self) {
                self = .integer(x)
                return
            }
            if let x = try? container.decode(String.self) {
                self = .string(x)
                return
            }
            throw DecodingError.typeMismatch(Kline.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Kline"))
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case let .integer(x):
                try container.encode(x)
            case let .string(x):
                try container.encode(x)
            }
        }
    }

    typealias Klines = [[Kline]]
}
