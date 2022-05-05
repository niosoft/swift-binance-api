import Foundation

public enum BinanceApiError: Error {
    case unknown(Error)
    case errorResponse(BinanceApiErrorResponse)
    case networkError(Data?, URLResponse?)
}
