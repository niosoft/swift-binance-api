@testable import SwiftBinanceApi
import XCTest

final class SwiftBinanceWalletTests: BinanceTestCase {
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

	func testApiRestrictions() {
		runAsyncTest {
			let apiRestrictions = try await self.binance.wallet.apiRestrictions()
			XCTAssertGreaterThan(apiRestrictions.createTime, 0)
		}
	}
}
