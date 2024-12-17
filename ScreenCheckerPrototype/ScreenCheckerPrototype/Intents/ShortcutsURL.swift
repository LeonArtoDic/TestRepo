import Foundation

enum Shortcuts {
    case checkPhoneNumber
    case extractorPhoneNumbers
    
    var url: URL? {
        switch self {
        case .checkPhoneNumber:
            URL(string: "https://www.icloud.com/shortcuts/7d976ed28a78492db72c24a26d93e3d8")
        case .extractorPhoneNumbers:
            URL(string: "https://www.icloud.com/shortcuts/ab7a257d8eb145a8af7ac6c7a2a75e3e")
        }
    }
}
