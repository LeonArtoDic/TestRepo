enum Link {
    case character
    
    var url: String {
        switch self {
        case .character:
            "https://rickandmortyapi.com/api/character/"
        }
    }
}
