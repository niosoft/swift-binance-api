import Foundation

public typealias AllCoinsInformation = [CoinInfo]

// MARK: - CoinInfo

public struct CoinInfo: Codable {
    public let coin: String
    public let depositAllEnable, withdrawAllEnable: Bool
    public let name, free, locked, freeze: String
    public let withdrawing, ipoing, ipoable, storage: String
    public let isLegalMoney, trading: Bool
    public let networkList: [NetworkList]

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
    public let network, coin, withdrawIntegerMultiple: String
    public let isDefault, depositEnable, withdrawEnable: Bool
    public let depositDesc: String
    public let withdrawDesc, specialTips, specialWithdrawTips: String?
    public let name: String
    public let resetAddressStatus: Bool
    public let addressRegex: String
    public let addressRule: String
    public let memoRegex: String
    public let withdrawFee, withdrawMin, withdrawMax: String
    public let minConfirm, unLockConfirm: Int
    public let sameAddress: Bool
    public let depositDust: String?

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
