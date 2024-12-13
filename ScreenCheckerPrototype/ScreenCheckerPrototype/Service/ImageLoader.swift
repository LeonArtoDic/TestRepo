import SwiftUI

protocol ImageLoaderProtocol {
    func loadImage(from urlString: String) async -> Image?
}

final class ImageLoader: ImageLoaderProtocol {
    static let shared = ImageLoader()
    private let cache = NSCache<NSString, UIImage>()

    func loadImage(from urlString: String) async -> Image? {
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            return Image(uiImage: cachedImage)
        }

        guard let url = URL(string: urlString) else {
            return nil
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let uiImage = UIImage(data: data) {
                cache.setObject(uiImage, forKey: urlString as NSString)
                return Image(uiImage: uiImage)
            }
        } catch {
            print("Failed to load image: \(error)")
        }

        return nil
    }
}
