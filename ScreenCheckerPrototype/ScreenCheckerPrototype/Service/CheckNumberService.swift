final public class CheckNumberService {
    private let networkManager = NetworkManager.shared

    func chekPhone(number: String) async throws -> Character {
        let character = try await networkManager.fetchCharacter(with: number)
        return character
    }
}
