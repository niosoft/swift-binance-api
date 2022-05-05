@testable import SwiftBinanceApi
import XCTest

final class SwiftBinanceWalletTests: XCTestCase {
    let binance = Binance(apiKey: "", secretKey: "")

    func testSystemStatus() {
        runAsyncTest {
            let systemStatus = try await self.binance.wallet.systemStatus()
            XCTAssertNotEqual(systemStatus.msg, "")
        }
    }

    func testAllCoinsInformation() {
        runAsyncTest {
            let coinsInfo = try await self.binance.wallet.allCoinsInformation()
            XCTAssertGreaterThan(coinsInfo.count, 0)
        }
    }
}
