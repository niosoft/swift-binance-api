@testable import SwiftBinanceApi
import XCTest

final class SwiftBinanceFuturesTests: BinanceTestCase {
    func testPrices() {
        runAsyncTest {
            let prices = try await self.binance.futures.prices()
            XCTAssertGreaterThan(prices.count, 0)
        }
    }

    func testPrice() {
        runAsyncTest {
            let price = try await self.binance.futures.price(symbol: "BTCUSDT")
            XCTAssertEqual(price.symbol, "BTCUSDT")
        }
    }
}
