@testable import SwiftBinanceApi
import XCTest

final class SwiftBinanceMarketTests: BinanceTestCase {
    func testServerTime() {
        runAsyncTest {
            let serverTime = try await self.binance.spot.serverTime()
            XCTAssertGreaterThan(serverTime, 0)
        }
    }

    func testExchangeInfo() {
        runAsyncTest {
            let exchangeInfo = try await self.binance.spot.exchangeInfo()
            XCTAssertGreaterThan(exchangeInfo.rateLimits.count, 0)
            XCTAssertGreaterThan(exchangeInfo.symbols.count, 0)
            XCTAssertGreaterThan(exchangeInfo.serverTime, 0)
        }
    }

    func testOrderBook() {
        runAsyncTest {
            let orderBook1 = try await self.binance.spot.orderBook(symbol: "BTCUSDT")
            XCTAssertEqual(orderBook1.asks.count, 100)
            XCTAssertEqual(orderBook1.bids.count, 100)

            let orderBook2 = try await self.binance.spot.orderBook(symbol: "BTCUSDT", limit: 500)
            XCTAssertEqual(orderBook2.asks.count, 500)
            XCTAssertEqual(orderBook2.bids.count, 500)
        }
    }

    func testRecentTrades() {
        runAsyncTest {
            let recentTrades1 = try await self.binance.spot.recentTrades(symbol: "BTCUSDT")
            XCTAssertEqual(recentTrades1.count, 500)

            let recentTrades2 = try await self.binance.spot.recentTrades(symbol: "BTCUSDT", limit: 1000)
            XCTAssertEqual(recentTrades2.count, 1000)

            let recentTrades3 = try await self.binance.spot.recentTrades(symbol: "BTCUSDT", limit: 2000)
            XCTAssertEqual(recentTrades3.count, 1000)
        }
    }

    func testSystemStatus() {
        runAsyncTest {
            let systemStatus = try await self.binance.spot.systemStatus()
            XCTAssertNotEqual(systemStatus.msg, "")
        }
    }

    func testAllCoinsInformation() {
        runAsyncTest {
            let coinsInfo = try await self.binance.spot.allCoinsInformation()
            XCTAssertGreaterThan(coinsInfo.count, 0)
        }
    }

    func testApiRestrictions() {
        runAsyncTest {
            let apiRestrictions = try await self.binance.spot.apiRestrictions()
            XCTAssertGreaterThan(apiRestrictions.createTime, 0)
        }
    }
}
