import XCTest
@testable import SwiftBinanceApi

final class SwiftBinanceWalletTests: XCTestCase {
	let binance = Binance(apiKey: "", secretKey: "")

	func testSystemStatus() {
		runAsyncTest {
			let systemStatus = try await self.binance.wallet.systemStatus()
			XCTAssertNotEqual(systemStatus.msg, "")
		}
	}
}
