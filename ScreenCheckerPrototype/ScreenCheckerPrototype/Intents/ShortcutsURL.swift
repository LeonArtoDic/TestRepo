import Foundation

enum Shortcuts {
    case checkPhoneNumber
    
    var url: URL? {
        switch self {
        case .checkPhoneNumber:
            URL(string: "https://www.icloud.com/shortcuts/7d976ed28a78492db72c24a26d93e3d8")
        }
    }
}
