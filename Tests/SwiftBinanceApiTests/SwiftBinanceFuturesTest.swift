@testable import SwiftBinanceApi
import XCTest

final class SwiftBinanceFuturesTests: BinanceTestCase {
    func testServerTime() {
        runAsyncTest {
            let serverTime = try await self.binance.futures.serverTime()
            XCTAssertGreaterThan(serverTime, 0)
        }
    }

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

    func testPricesDaily() {
        runAsyncTest {
            let prices = try await self.binance.futures.pricesDaily()
            XCTAssertGreaterThan(prices.count, 0)
        }
    }

    func testPriceDaily() {
        runAsyncTest {
            let price = try await self.binance.futures.priceDaily(symbol: "BTCUSDT")
            XCTAssertEqual(price.symbol, "BTCUSDT")
        }
    }

    func testExchangeInfo() {
        runAsyncTest {
            let exchangeInfo = try await self.binance.futures.exchangeInfo()
            XCTAssertGreaterThan(exchangeInfo.rateLimits.count, 0)
            XCTAssertGreaterThan(exchangeInfo.symbols.count, 0)
            XCTAssertGreaterThan(exchangeInfo.serverTime, 0)
        }
    }

    func testAccountInfo() {
        runAsyncTest {
            let accountInfo = try await self.binance.futures.accountInfo()
            XCTAssertNotEqual(accountInfo.maxWithdrawAmount, "")
        }
    }

    func testOpenInterest() {
        runAsyncTest {
            let openInterest = try await self.binance.futures.openInterest(symbol: "BTCUSDT")
            XCTAssertEqual(openInterest.symbol, "BTCUSDT")
        }
    }

    func testKlines() {
        runAsyncTest {
            let klines1 = try await self.binance.futures.klines(symbol: "BTCUSDT", interval: .oneHour)
            XCTAssertEqual(klines1.count, 500)

            let klines2 = try await self.binance.futures.klines(symbol: "BTCUSDT", interval: .oneHour, limit: 1000)
            XCTAssertEqual(klines2.count, 1000)

            let klines3 = try await self.binance.futures.klines(symbol: "BTCUSDT", interval: .oneHour, limit: 1500)
            XCTAssertEqual(klines3.count, 1500)
        }
    }

    func testMarkPrices() {
        runAsyncTest {
            let markPrices = try await self.binance.futures.markPrices()
            XCTAssertGreaterThan(markPrices.count, 0)
        }
    }

    func testMarkPrice() {
        runAsyncTest {
            let markPrices = try await self.binance.futures.markPrice(symbol: "BTCUSDT")
            XCTAssertEqual(markPrices.symbol, "BTCUSDT")
        }
    }

    func testRecentTrades() {
        runAsyncTest {
            let recentTrades = try await self.binance.futures.recentTrades(symbol: "BTCUSDT")
            XCTAssertEqual(recentTrades.count, 500)

            let recentTrades2 = try await self.binance.futures.recentTrades(symbol: "BTCUSDT", limit: 1000)
            XCTAssertEqual(recentTrades2.count, 1000)
        }
    }

    func testHistoricalTrades() {
        runAsyncTest {
            let historicalTrades = try await self.binance.futures.historicalTrades(symbol: "BTCUSDT")
            XCTAssertEqual(historicalTrades.count, 500)

            let historicalTrades2 = try await self.binance.futures.historicalTrades(symbol: "BTCUSDT", limit: 1000)
            XCTAssertEqual(historicalTrades2.count, 1000)
        }
    }
}
