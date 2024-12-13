//struct Character: Decodable {
//    let name: String
//    let location: String
//    let image: String
//}
//
struct Character: Decodable {
    let name: String
    let location: Location
    let image: String

    struct Location: Decodable {
        let name: String
    }
}
