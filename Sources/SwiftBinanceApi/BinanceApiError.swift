//
//  BinanceApiError.swift
//  BinanceApi
//
//  Created by Dionisis Karatzas on 2/5/22.
//

import Foundation

public enum BinanceApiError: Error {
	case unknown(Error)
	case errorResponse(BinanceApiErrorResponse)
	case networkError(Data?, URLResponse?)
}
