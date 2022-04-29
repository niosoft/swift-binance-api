//
//  BinanceWalletRequests.swift
//  BinanceApi
//
//  Created by Dionisis Karatzas on 2/5/22.
//

import Foundation

public enum BinanceWalletRequests {
	public struct SystemStatusRequest: BinanceApiRequest {
		static let method: HTTPMethod = .GET
		static let baseUrl: BinanceBaseUrl = .sapi
		static let endpoint = "v1/system/status"

		public typealias Response = SystemStatus
	}
}
