import Foundation

// MARK: - ApiRestrictions
public struct ApiRestrictions: Codable {
	public let ipRestrict: Bool
	public let createTime: Int
	public let enableReading: Bool
	public let enableSpotAndMarginTrading: Bool
	public let enableWithdrawals: Bool
	public let enableInternalTransfer: Bool
	public let permitsUniversalTransfer: Bool
	public let enableMargin: Bool
	public let enableFutures: Bool
	public let enableVanillaOptions: Bool

	enum CodingKeys: String, CodingKey {
		case ipRestrict = "ipRestrict"
		case createTime = "createTime"
		case enableReading = "enableReading"
		case enableSpotAndMarginTrading = "enableSpotAndMarginTrading"
		case enableWithdrawals = "enableWithdrawals"
		case enableInternalTransfer = "enableInternalTransfer"
		case permitsUniversalTransfer = "permitsUniversalTransfer"
		case enableMargin = "enableMargin"
		case enableFutures = "enableFutures"
		case enableVanillaOptions = "enableVanillaOptions"
	}

	public init(ipRestrict: Bool, createTime: Int, enableReading: Bool, enableSpotAndMarginTrading: Bool, enableWithdrawals: Bool, enableInternalTransfer: Bool, permitsUniversalTransfer: Bool, enableMargin: Bool, enableFutures: Bool, enableVanillaOptions: Bool) {
		self.ipRestrict = ipRestrict
		self.createTime = createTime
		self.enableReading = enableReading
		self.enableSpotAndMarginTrading = enableSpotAndMarginTrading
		self.enableWithdrawals = enableWithdrawals
		self.enableInternalTransfer = enableInternalTransfer
		self.permitsUniversalTransfer = permitsUniversalTransfer
		self.enableMargin = enableMargin
		self.enableFutures = enableFutures
		self.enableVanillaOptions = enableVanillaOptions
	}
}
