//
//  File.swift
//
//
//  Created by Dionisis Karatzas on 8/5/22.
//

import Foundation

public enum PositionSide: String, Codable {
    case both = "BOTH"
    case long = "LONG"
    case short = "SHORT"
}

public enum OrderSide: String, Codable {
    case buy = "BUY"
    case sell = "SELL"
}

public enum OrderType: String, Codable {
    case limit = "LIMIT"
    case market = "MARKET"
    case stop = "STOP"
    case stopMarket = "STOP_MARKET"
    case stopLoss = "STOP_LOSS"
    case stopLossLimit = "STOP_LOSS_LIMIT"
    case takeProfit = "TAKE_PROFIT"
    case takeProfitMarket = "TAKE_PROFIT_MARKET"
    case takeProfitLimit = "TAKE_PROFIT_LIMIT"
    case trailingStopMarket = "TRAILING_STOP_MARKET"
    case limitMaker = "LIMIT_MAKER"
}

public enum OrderStatus: String, Codable {
    case new = "NEW"
    case partiallyFilled = "PARTIALLY_FILLED"
    case filled = "FILLED"
    case canceled = "CANCELED"
    case pendingCancel = "PENDING_CANCEL"
    case rejected = "REJECTED"
    case expired = "EXPIRED"
}

public enum TimeInForce: String, Codable {
    ///  An order will be on the book unless the order is canceled.
    case goodTillCancel = "GTC"
    ///  An order will try to fill the order as much as it can before the order expires.
    case immediateOrCancel = "IOC"
    ///  An order will expire if the full order cannot be filled upon execution.
    case fillOrKill = "FOK"
    case goodTillCrossing = "GTX"
}

public enum OrderResponseType: String, Codable {
    case ack = "ACK"
    case result = "RESULT"
    case full = "FULL"
}

public enum FilterType: String, Codable {
    case icebergParts = "ICEBERG_PARTS"
    case lotSize = "LOT_SIZE"
    case marketLotSize = "MARKET_LOT_SIZE"
    case maxNumAlgoOrders = "MAX_NUM_ALGO_ORDERS"
    case maxNumOrders = "MAX_NUM_ORDERS"
    case maxPosition = "MAX_POSITION"
    case minNotional = "MIN_NOTIONAL"
    case percentPrice = "PERCENT_PRICE"
    case priceFilter = "PRICE_FILTER"
    case trailingDelta = "TRAILING_DELTA"
}

public enum Permission: String, Codable {
    case leveraged = "LEVERAGED"
    case margin = "MARGIN"
    case spot = "SPOT"
    case trdGrp003 = "TRD_GRP_003"
}

public enum QuoteAsset: String, Codable {
    case aud = "AUD"
    case bidr = "BIDR"
    case bkrw = "BKRW"
    case bnb = "BNB"
    case brl = "BRL"
    case btc = "BTC"
    case busd = "BUSD"
    case bvnd = "BVND"
    case dai = "DAI"
    case doge = "DOGE"
    case dot = "DOT"
    case eth = "ETH"
    case eur = "EUR"
    case gbp = "GBP"
    case gyen = "GYEN"
    case idrt = "IDRT"
    case ngn = "NGN"
    case pax = "PAX"
    case quoteAssetTRY = "TRY"
    case rub = "RUB"
    case trx = "TRX"
    case tusd = "TUSD"
    case uah = "UAH"
    case usdc = "USDC"
    case usdp = "USDP"
    case usds = "USDS"
    case usdt = "USDT"
    case ust = "UST"
    case vai = "VAI"
    case xrp = "XRP"
    case zar = "ZAR"
}

public enum Status: String, Codable {
    case statusBREAK = "BREAK"
    case trading = "TRADING"
}

public enum Intervals: String, Codable {
    case oneMinute = "1m"
    case threeMinutes = "3m"
    case fiveMinutes = "5m"
    case fifteenMinutes = "15m"
    case thirtyMinutes = "30m"
    case oneHour = "1h"
    case twoHours = "2h"
    case fourHours = "4h"
    case sixhours = "6h"
    case eightHours = "8h"
    case twelveHours = "12h"
    case oneDay = "1d"
    case threeDays = "3d"
    case oneWeek = "1w"
    case oneMonth = "1M"
}

public enum ContractType: String, Codable {
    case perpetual = "PERPETUAL"
    case currentMonth = "CURRENT_MONTH"
    case nextMonth = "NEXT_MONTH"
    case currentQuarter = "CURRENT_QUARTER"
    case nextQuarter = "NEXT_QUARTER"
}
