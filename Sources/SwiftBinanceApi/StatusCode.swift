import Foundation

public enum HTTPStatusCode: Int {
    case informational = 100
    case success = 200
    case redirection = 300
    case clientError = 400
    case serverError = 500
    case unknown = 999

    public init(code: Int) {
        switch code {
        case 100 ... 199: self = .informational
        case 200 ... 299: self = .success
        case 300 ... 399: self = .redirection
        case 400 ... 499: self = .clientError
        case 500 ... 599: self = .serverError
        default: self = .unknown
        }
    }
}

extension HTTPURLResponse {
    var status: HTTPStatusCode {
        return HTTPStatusCode(rawValue: statusCode) ?? .unknown
    }
}
