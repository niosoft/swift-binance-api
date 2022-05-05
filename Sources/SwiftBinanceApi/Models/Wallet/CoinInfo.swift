import Foundation

// MARK: - CoinInfo
public struct CoinInfo: Codable {
	public let coin: String
	public let depositAllEnable: Bool
	public let withdrawAllEnable: Bool
	public let name: String
	public let free: String
	public let locked: String
	public let freeze: String
	public let withdrawing: String
	public let ipoing: String
	public let ipoable: String
	public let storage: String
	public let isLegalMoney: Bool
	public let trading: Bool
	public let networkList: [NetworkList]

	enum CodingKeys: String, CodingKey {
		case coin = "coin"
		case depositAllEnable = "depositAllEnable"
		case withdrawAllEnable = "withdrawAllEnable"
		case name = "name"
		case free = "free"
		case locked = "locked"
		case freeze = "freeze"
		case withdrawing = "withdrawing"
		case ipoing = "ipoing"
		case ipoable = "ipoable"
		case storage = "storage"
		case isLegalMoney = "isLegalMoney"
		case trading = "trading"
		case networkList = "networkList"
	}

	public init(coin: String, depositAllEnable: Bool, withdrawAllEnable: Bool, name: String, free: String, locked: String, freeze: String, withdrawing: String, ipoing: String, ipoable: String, storage: String, isLegalMoney: Bool, trading: Bool, networkList: [NetworkList]) {
		self.coin = coin
		self.depositAllEnable = depositAllEnable
		self.withdrawAllEnable = withdrawAllEnable
		self.name = name
		self.free = free
		self.locked = locked
		self.freeze = freeze
		self.withdrawing = withdrawing
		self.ipoing = ipoing
		self.ipoable = ipoable
		self.storage = storage
		self.isLegalMoney = isLegalMoney
		self.trading = trading
		self.networkList = networkList
	}
}

// MARK: - NetworkList
public struct NetworkList: Codable {
	public let network: String
	public let coin: String
	public let withdrawIntegerMultiple: String
	public let isDefault: Bool
	public let depositEnable: Bool
	public let withdrawEnable: Bool
	public let depositDesc: String
	public let withdrawDesc: String?
	public let specialTips: String?
	public let specialWithdrawTips: String?
	public let name: String
	public let resetAddressStatus: Bool
	public let addressRegex: String
	public let addressRule: String
	public let memoRegex: String
	public let withdrawFee: String
	public let withdrawMin: String
	public let withdrawMax: String
	public let minConfirm: Int
	public let unLockConfirm: Int
	public let sameAddress: Bool
	public let depositDust: String?

	enum CodingKeys: String, CodingKey {
		case network = "network"
		case coin = "coin"
		case withdrawIntegerMultiple = "withdrawIntegerMultiple"
		case isDefault = "isDefault"
		case depositEnable = "depositEnable"
		case withdrawEnable = "withdrawEnable"
		case depositDesc = "depositDesc"
		case withdrawDesc = "withdrawDesc"
		case specialTips = "specialTips"
		case specialWithdrawTips = "specialWithdrawTips"
		case name = "name"
		case resetAddressStatus = "resetAddressStatus"
		case addressRegex = "addressRegex"
		case addressRule = "addressRule"
		case memoRegex = "memoRegex"
		case withdrawFee = "withdrawFee"
		case withdrawMin = "withdrawMin"
		case withdrawMax = "withdrawMax"
		case minConfirm = "minConfirm"
		case unLockConfirm = "unLockConfirm"
		case sameAddress = "sameAddress"
		case depositDust = "depositDust"
	}

	public init(network: String, coin: String, withdrawIntegerMultiple: String, isDefault: Bool, depositEnable: Bool, withdrawEnable: Bool, depositDesc: String, withdrawDesc: String?, specialTips: String?, specialWithdrawTips: String?, name: String, resetAddressStatus: Bool, addressRegex: String, addressRule: String, memoRegex: String, withdrawFee: String, withdrawMin: String, withdrawMax: String, minConfirm: Int, unLockConfirm: Int, sameAddress: Bool, depositDust: String?) {
		self.network = network
		self.coin = coin
		self.withdrawIntegerMultiple = withdrawIntegerMultiple
		self.isDefault = isDefault
		self.depositEnable = depositEnable
		self.withdrawEnable = withdrawEnable
		self.depositDesc = depositDesc
		self.withdrawDesc = withdrawDesc
		self.specialTips = specialTips
		self.specialWithdrawTips = specialWithdrawTips
		self.name = name
		self.resetAddressStatus = resetAddressStatus
		self.addressRegex = addressRegex
		self.addressRule = addressRule
		self.memoRegex = memoRegex
		self.withdrawFee = withdrawFee
		self.withdrawMin = withdrawMin
		self.withdrawMax = withdrawMax
		self.minConfirm = minConfirm
		self.unLockConfirm = unLockConfirm
		self.sameAddress = sameAddress
		self.depositDust = depositDust
	}
}

public typealias AllCoinsInformation = [CoinInfo]
