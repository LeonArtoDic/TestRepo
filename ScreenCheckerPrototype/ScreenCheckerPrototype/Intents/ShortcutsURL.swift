import Foundation

enum Shortcuts {
    case checkPhoneNumber
    
    var url: URL? {
        switch self {
        case .checkPhoneNumber:
            URL(string: "https://www.icloud.com/shortcuts/7b9923a66cfa4410b1300b69450bc7ab")
        }
    }
}
