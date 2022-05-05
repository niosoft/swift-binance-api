import Foundation

// MARK: - ExchangeInfo

public struct ExchangeInfo: Codable {
    public let timezone: String
    public let serverTime: Int
    public let rateLimits: [RateLimit]
    public let exchangeFilters: [JSONAny]
    public let symbols: [Symbol]

    public init(timezone: String, serverTime: Int, rateLimits: [RateLimit], exchangeFilters: [JSONAny], symbols: [Symbol]) {
        self.timezone = timezone
        self.serverTime = serverTime
        self.rateLimits = rateLimits
        self.exchangeFilters = exchangeFilters
        self.symbols = symbols
    }
}

// MARK: - RateLimit

public struct RateLimit: Codable {
    public let rateLimitType: String
    public let interval: String
    public let intervalNum: Int
    public let limit: Int

    public init(rateLimitType: String, interval: String, intervalNum: Int, limit: Int) {
        self.rateLimitType = rateLimitType
        self.interval = interval
        self.intervalNum = intervalNum
        self.limit = limit
    }
}

// MARK: - Symbol

public struct Symbol: Codable {
    public let symbol: String
    public let status: Status
    public let baseAsset: String
    public let baseAssetPrecision: Int
    public let quoteAsset: QuoteAsset
    public let quotePrecision: Int
    public let quoteAssetPrecision: Int
    public let baseCommissionPrecision: Int
    public let quoteCommissionPrecision: Int
    public let orderTypes: [OrderType]
    public let icebergAllowed: Bool
    public let ocoAllowed: Bool
    public let quoteOrderQtyMarketAllowed: Bool
    public let allowTrailingStop: Bool
    public let isSpotTradingAllowed: Bool
    public let isMarginTradingAllowed: Bool
    public let filters: [Filter]
    public let permissions: [Permission]

    public init(symbol: String, status: Status, baseAsset: String, baseAssetPrecision: Int, quoteAsset: QuoteAsset, quotePrecision: Int, quoteAssetPrecision: Int, baseCommissionPrecision: Int, quoteCommissionPrecision: Int, orderTypes: [OrderType], icebergAllowed: Bool, ocoAllowed: Bool, quoteOrderQtyMarketAllowed: Bool, allowTrailingStop: Bool, isSpotTradingAllowed: Bool, isMarginTradingAllowed: Bool, filters: [Filter], permissions: [Permission]) {
        self.symbol = symbol
        self.status = status
        self.baseAsset = baseAsset
        self.baseAssetPrecision = baseAssetPrecision
        self.quoteAsset = quoteAsset
        self.quotePrecision = quotePrecision
        self.quoteAssetPrecision = quoteAssetPrecision
        self.baseCommissionPrecision = baseCommissionPrecision
        self.quoteCommissionPrecision = quoteCommissionPrecision
        self.orderTypes = orderTypes
        self.icebergAllowed = icebergAllowed
        self.ocoAllowed = ocoAllowed
        self.quoteOrderQtyMarketAllowed = quoteOrderQtyMarketAllowed
        self.allowTrailingStop = allowTrailingStop
        self.isSpotTradingAllowed = isSpotTradingAllowed
        self.isMarginTradingAllowed = isMarginTradingAllowed
        self.filters = filters
        self.permissions = permissions
    }
}

// MARK: - Filter

public struct Filter: Codable {
    public let filterType: FilterType
    public let minPrice: String?
    public let maxPrice: String?
    public let tickSize: String?
    public let multiplierUp: String?
    public let multiplierDown: String?
    public let avgPriceMins: Int?
    public let minQty: String?
    public let maxQty: String?
    public let stepSize: String?
    public let minNotional: String?
    public let applyToMarket: Bool?
    public let limit: Int?
    public let minTrailingAboveDelta: Int?
    public let maxTrailingAboveDelta: Int?
    public let minTrailingBelowDelta: Int?
    public let maxTrailingBelowDelta: Int?
    public let maxNumOrders: Int?
    public let maxNumAlgoOrders: Int?
    public let maxPosition: String?

    public init(filterType: FilterType, minPrice: String?, maxPrice: String?, tickSize: String?, multiplierUp: String?, multiplierDown: String?, avgPriceMins: Int?, minQty: String?, maxQty: String?, stepSize: String?, minNotional: String?, applyToMarket: Bool?, limit: Int?, minTrailingAboveDelta: Int?, maxTrailingAboveDelta: Int?, minTrailingBelowDelta: Int?, maxTrailingBelowDelta: Int?, maxNumOrders: Int?, maxNumAlgoOrders: Int?, maxPosition: String?) {
        self.filterType = filterType
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        self.tickSize = tickSize
        self.multiplierUp = multiplierUp
        self.multiplierDown = multiplierDown
        self.avgPriceMins = avgPriceMins
        self.minQty = minQty
        self.maxQty = maxQty
        self.stepSize = stepSize
        self.minNotional = minNotional
        self.applyToMarket = applyToMarket
        self.limit = limit
        self.minTrailingAboveDelta = minTrailingAboveDelta
        self.maxTrailingAboveDelta = maxTrailingAboveDelta
        self.minTrailingBelowDelta = minTrailingBelowDelta
        self.maxTrailingBelowDelta = maxTrailingBelowDelta
        self.maxNumOrders = maxNumOrders
        self.maxNumAlgoOrders = maxNumAlgoOrders
        self.maxPosition = maxPosition
    }
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

public enum OrderType: String, Codable {
    case limit = "LIMIT"
    case limitMaker = "LIMIT_MAKER"
    case market = "MARKET"
    case stopLossLimit = "STOP_LOSS_LIMIT"
    case takeProfitLimit = "TAKE_PROFIT_LIMIT"
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
