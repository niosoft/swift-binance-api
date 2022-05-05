import Foundation

extension Date {
    var millisecondsSince1970: UInt64 {
        return UInt64(timeIntervalSince1970 * 1000)
    }

    init(milliseconds: UInt64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }

    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
