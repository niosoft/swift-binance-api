import Foundation

public extension Binance.Futures {
    // MARK: - Account

    struct Account: Codable {
        public let feeTier: Int
        public let canTrade: Bool
        public let canDeposit: Bool
        public let canWithdraw: Bool
        public let updateTime: Int
        public let totalInitialMargin: String
        public let totalMaintMargin: String
        public let totalWalletBalance: String
        public let totalUnrealizedProfit: String
        public let totalMarginBalance: String
        public let totalPositionInitialMargin: String
        public let totalOpenOrderInitialMargin: String
        public let totalCrossWalletBalance: String
        public let totalCrossUnPnl: String
        public let availableBalance: String
        public let maxWithdrawAmount: String
        public let assets: [Asset]
        public let positions: [Position]

        public init(feeTier: Int, canTrade: Bool, canDeposit: Bool, canWithdraw: Bool, updateTime: Int, totalInitialMargin: String, totalMaintMargin: String, totalWalletBalance: String, totalUnrealizedProfit: String, totalMarginBalance: String, totalPositionInitialMargin: String, totalOpenOrderInitialMargin: String, totalCrossWalletBalance: String, totalCrossUnPnl: String, availableBalance: String, maxWithdrawAmount: String, assets: [Asset], positions: [Position]) {
            self.feeTier = feeTier
            self.canTrade = canTrade
            self.canDeposit = canDeposit
            self.canWithdraw = canWithdraw
            self.updateTime = updateTime
            self.totalInitialMargin = totalInitialMargin
            self.totalMaintMargin = totalMaintMargin
            self.totalWalletBalance = totalWalletBalance
            self.totalUnrealizedProfit = totalUnrealizedProfit
            self.totalMarginBalance = totalMarginBalance
            self.totalPositionInitialMargin = totalPositionInitialMargin
            self.totalOpenOrderInitialMargin = totalOpenOrderInitialMargin
            self.totalCrossWalletBalance = totalCrossWalletBalance
            self.totalCrossUnPnl = totalCrossUnPnl
            self.availableBalance = availableBalance
            self.maxWithdrawAmount = maxWithdrawAmount
            self.assets = assets
            self.positions = positions
        }

        // MARK: - Asset

        public struct Asset: Codable {
            public let asset: String
            public let walletBalance: String
            public let unrealizedProfit: String
            public let marginBalance: String
            public let maintMargin: String
            public let initialMargin: String
            public let positionInitialMargin: String
            public let openOrderInitialMargin: String
            public let maxWithdrawAmount: String
            public let crossWalletBalance: String
            public let crossUnPnl: String
            public let availableBalance: String
            public let marginAvailable: Bool
            public let updateTime: Int

            public init(asset: String, walletBalance: String, unrealizedProfit: String, marginBalance: String, maintMargin: String, initialMargin: String, positionInitialMargin: String, openOrderInitialMargin: String, maxWithdrawAmount: String, crossWalletBalance: String, crossUnPnl: String, availableBalance: String, marginAvailable: Bool, updateTime: Int) {
                self.asset = asset
                self.walletBalance = walletBalance
                self.unrealizedProfit = unrealizedProfit
                self.marginBalance = marginBalance
                self.maintMargin = maintMargin
                self.initialMargin = initialMargin
                self.positionInitialMargin = positionInitialMargin
                self.openOrderInitialMargin = openOrderInitialMargin
                self.maxWithdrawAmount = maxWithdrawAmount
                self.crossWalletBalance = crossWalletBalance
                self.crossUnPnl = crossUnPnl
                self.availableBalance = availableBalance
                self.marginAvailable = marginAvailable
                self.updateTime = updateTime
            }
        }

        // MARK: - Position

        public struct Position: Codable {
            public let symbol: String
            public let initialMargin: String
            public let maintMargin: String
            public let unrealizedProfit: String
            public let positionInitialMargin: String
            public let openOrderInitialMargin: String
            public let leverage: String
            public let isolated: Bool
            public let entryPrice: String
            public let maxNotional: String
            public let positionSide: PositionSide
            public let positionAmt: String
            public let notional: String
            public let isolatedWallet: String
            public let updateTime: Int
            public let bidNotional: String
            public let askNotional: String

            public init(symbol: String, initialMargin: String, maintMargin: String, unrealizedProfit: String, positionInitialMargin: String, openOrderInitialMargin: String, leverage: String, isolated: Bool, entryPrice: String, maxNotional: String, positionSide: PositionSide, positionAmt: String, notional: String, isolatedWallet: String, updateTime: Int, bidNotional: String, askNotional: String) {
                self.symbol = symbol
                self.initialMargin = initialMargin
                self.maintMargin = maintMargin
                self.unrealizedProfit = unrealizedProfit
                self.positionInitialMargin = positionInitialMargin
                self.openOrderInitialMargin = openOrderInitialMargin
                self.leverage = leverage
                self.isolated = isolated
                self.entryPrice = entryPrice
                self.maxNotional = maxNotional
                self.positionSide = positionSide
                self.positionAmt = positionAmt
                self.notional = notional
                self.isolatedWallet = isolatedWallet
                self.updateTime = updateTime
                self.bidNotional = bidNotional
                self.askNotional = askNotional
            }
        }
    }
}
