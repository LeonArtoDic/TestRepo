import Foundation

final public class NetworkManager {
    public static let shared = NetworkManager()
    
    private init(){}
        
    private let decoder = JSONDecoder()
    
    func fetchCharacter(with id: String) async throws -> Character {
        guard let url = URL(string: Link.character.url + String(id)) else {
            throw NetworkErrors.badURL
        }
        
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkErrors.requestFailed
        }
        
        do {
            return try decoder.decode(Character.self, from: data)
        } catch {
            throw NetworkErrors.decodingFailed
        }
    }
}
