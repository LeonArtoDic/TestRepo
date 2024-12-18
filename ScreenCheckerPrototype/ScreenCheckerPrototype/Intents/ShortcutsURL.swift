import Foundation

enum Shortcuts {
    case checkPhoneNumber
    case extractorPhoneNumbers
    
    var url: URL? {
        switch self {
        case .checkPhoneNumber:
            URL(string: "https://www.icloud.com/shortcuts/7d976ed28a78492db72c24a26d93e3d8")
        case .extractorPhoneNumbers:
            URL(string: "https://www.icloud.com/shortcuts/38eb56ef83544c8b82b93ce39456b7b4")
        }
    }
}
